# StockFlow Backend Case Study

This repository contains my solution to the StockFlow backend case study.

## What I focused on

- Fixing correctness issues in the given API
- Designing a schema that supports multi-warehouse inventory
- Building a low-stock alert system based on business constraints

## Key Decisions

- Used relational design instead of NoSQL due to consistency requirements
- Separated inventory into its own table to support multiple warehouses
- Prioritized clarity and correctness given the time constraint

## Project Structure

- part1 → Code review and fixes
- part2 → Database design and schema
- part3 → API design and logic
- src → Minimal implementation

## Assumptions

- Recent sales = last 7 days
- Threshold stored per product
- Each product has at least one supplier

## Note

Given the 90-minute constraint, I focused on making trade-offs explicit rather than building a fully production-ready system.
