#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import json
import zipfile
import xml.etree.ElementTree as ET

# Extract from docx
with zipfile.ZipFile('Roadmap.docx', 'r') as zip_ref:
    xml_content = zip_ref.read('word/document.xml')

root = ET.fromstring(xml_content)
ns = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}

paragraphs = []
for paragraph in root.findall('.//w:p', ns):
    text_elements = paragraph.findall('.//w:t', ns)
    if text_elements:
        text = ''.join([elem.text for elem in text_elements if elem.text])
        if text.strip():
            paragraphs.append(text.strip())

content = '\n'.join(paragraphs)

# Parse days
days_data = []
day_pattern = r'Day (\d+) — ([^\n]+)\n'

# Split by "Day X —" pattern
day_blocks = re.findall(r'Day (\d+) — ([^\n]+)(.*?)(?=Day \d+|PHASE|Final|$)', content, re.DOTALL)

for day_num_str, title, block in day_blocks:
    day_num = int(day_num_str)
    definition = ''
    topics = []
    
    # Extract definition
    def_match = re.search(r'Definition:([^\n]+)', block)
    if def_match:
        definition = def_match.group(1).strip()
    
    # Extract topics
    topics_section = re.search(r'Topics:(.*?)(?=Day \d+|$)', block, re.DOTALL)
    if topics_section:
        topic_lines = [line.strip() for line in topics_section.group(1).split('\n') if line.strip()]
        topics = [t for t in topic_lines if t and not t.startswith('Definition')]
    
    days_data.append({
        'day': day_num,
        'title': title.strip(),
        'definition': definition,
        'topics': topics
    })

# Save as JSON with UTF-8
with open('roadmap_complete.json', 'w', encoding='utf-8') as f:
    json.dump(days_data, f, indent=2, ensure_ascii=False)

# Also save as structured text
with open('roadmap_structured.txt', 'w', encoding='utf-8') as f:
    for day_data in days_data:
        f.write(f"[DAY {day_data['day']}]\n")
        f.write(f"Title: {day_data['title']}\n")
        f.write(f"Definition: {day_data['definition']}\n")
        if day_data['topics']:
            f.write("Topics:\n")
            for topic in day_data['topics']:
                f.write(f"  - {topic}\n")
        f.write("\n")

print(f"✓ Successfully extracted {len(days_data)} days")
print(f"✓ Saved JSON to: roadmap_complete.json")
print(f"✓ Saved structured text to: roadmap_structured.txt")
print()
print("Verification:")
print(f"  First day: Day {days_data[0]['day']} - {days_data[0]['title']}")
print(f"  Last day: Day {days_data[-1]['day']} - {days_data[-1]['title']}")
print(f"  Total topics for Day 1: {len(days_data[0]['topics'])}")
