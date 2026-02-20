# Research Radar Extension — Technical Specification

**Version:** 1.0  
**Date:** 2026-02-20  
**Author:** Frontend Architect Agent  

---

## 1. Overview

This spec defines the extension of the existing **Ilya's 30 Papers** site to include **Research Radar** — Chris's actively tracked ~280 papers organized by 11 research themes. The result is a unified dual-collection research navigation tool.

### Design Principles
1. **Same site, two collections**: Ilya Canon (30 papers) + Research Radar (~280 papers)
2. **Unified data model**: Both collections use the same JSON schema with multi-theme tagging
3. **Preserve existing UX**: Timeline visualization + collapsible cards + read tracking
4. **Semi-manual updates**: Data embedded in HTML; updates via manual editing
5. **Trending section**: Standalone UI for recent/hot papers
6. **Single-file deployment**: All CSS/JS inline, data embedded, Vercel-friendly

---

## 2. Unified Data Model

### JSON Schema

```json
{
  "id": "unique-string-id",           // e.g., "ilya-01", "radar-self-evolve-001"
  "num": "01",                         // Display number (for Ilya Canon only)
  "title": "Paper Title",
  "year": 2018,                        // Publication year
  "datePublished": "2018-06",          // YYYY-MM (from arxiv ID or metadata)
  "collection": "canon|radar",         // Which collection
  "themes": ["attention", "scaling"],  // Multi-theme tags (canonical slugs)
  "subCategory": "Evolutionary coding agents", // Freeform category within theme
  "resources": [
    { "type": "paper", "url": "https://arxiv.org/abs/..." },
    { "type": "code", "url": "https://github.com/..." },
    { "type": "blog", "url": "https://..." },
    { "type": "demo", "url": "https://..." }
  ],
  "summary": "One-sentence summary",
  "origin": "Why this paper matters (Ilya Canon only)",
  "evolution": [...],                  // Milestones (Ilya Canon only)
  "frontier": "Current state (Ilya Canon only)",
  "connected": [1, 4, 14],             // IDs of connected papers (Ilya Canon only)
  "status": "unread|read",             // User reading status (localStorage)
  "priority": "high|medium|low|null",  // Radar priority flag (optional)
  "difficulty": "easy|medium|hard",    // Ilya Canon only
  "readingTime": "1–2 hrs",            // Ilya Canon only
  "frontierActive": true|false         // Ilya Canon only (pulsing effect)
}
```

### Canonical Theme Slugs (11 themes)

| Slug | Full Name | Color |
|------|-----------|-------|
| `self-evolve` | Self-Evolving Agents | `#588afd` |
| `verifiers` | Verifiers as Scaling Lever | `#0dc95c` |
| `science-agents` | Science Agents | `#acaaff` |
| `memory-reflection` | Memory & Reflection Primitives | `#fea149` |
| `test-time-learning` | Test-Time Learning | `#f17421` |
| `spawn-orchestration` | Spawn & Multi-Agent Orchestration | `#ec4d4d` |
| `proactive-agents` | Proactive Agents | `#01a78b` |
| `persistent-memory` | Agent Persistent Memory | `#d4d4f5` |
| `human-agent-interaction` | Human-Agent Interaction | `#ff6b9d` |
| `world-models` | World Models for Agents | `#9d50bb` |
| `evo-llm` | Evolutionary Computation + LLM | `#ffd700` |

**For Ilya Canon**, map existing 8 threads to these themes (backward-compatible):
- `attention` (Thread 1)
- `vision` (Thread 2)
- `sequence` (Thread 3)
- `optimization` (Thread 4)
- `memory` (Thread 5)
- `generative` (Thread 6)
- `scaling` (Thread 7)
- `meta` (Thread 8)

---

## 3. UI Architecture

### 3.1 Top-Level Navigation (Primary Tabs)

```
┌─────────────────────────────────────────────────────┐
│ 🍩 Ilya's 30 Papers + Research Radar               │
│ ┌─────────────────────────────────────────────────┐ │
│ │ Ilya Canon | Research Radar | Trending          │ │
│ └─────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────┘
```

- **Ilya Canon**: Existing evolution tree view (preserve current design)
- **Research Radar**: Dashboard → Theme detail view → Paper view
- **Trending**: Standalone section for papers from last 6 months, sorted by date

### 3.2 Research Radar View Structure

#### 3.2.1 Dashboard (Main Landing)

Grid of 11 theme cards:

```
┌──────────────────────────────────────────────────────┐
│ Research Radar — 280 papers across 11 themes        │
│ [Search bar] [Filter: All | Unread | High Priority] │
├──────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌───────────┐  │
│  │ Self-Evolve  │  │  Verifiers   │  │  Science  │  │
│  │  43 papers   │  │   1 paper    │  │ Agents    │  │
│  │  ●●●●○○○○    │  │  ●○○○○○○○    │  │ 3 papers  │  │
│  │  18 read     │  │   0 read     │  │ ●○○○○○○○  │  │
│  └──────────────┘  └──────────────┘  └───────────┘  │
│  ...                                                 │
└──────────────────────────────────────────────────────┘
```

Each card shows:
- Theme name + emoji icon
- Paper count
- Read progress bar (visual + "X read" label)
- Click → opens theme detail view

#### 3.2.2 Theme Detail View

Nested list organized by `subCategory`:

```
┌──────────────────────────────────────────────────────┐
│ ← Back to Dashboard          Self-Evolving Agents    │
│ [Search within theme]                                │
├──────────────────────────────────────────────────────┤
│ ▼ Evolutionary coding agents (12)                    │
│   □ AlphaEvolve                     📄 🔗 📝  2025-06│
│   □ LoongFlow                       📄 📝     2025-12│
│   ☑ ShinkaEvolve                    📄 💻 📝  2025-09│
│   ...                                                │
│                                                      │
│ ▼ Self-evolving agents (18)                          │
│   □ Alita                           📄 💻     2025-05│
│   ...                                                │
└──────────────────────────────────────────────────────┘
```

Features:
- Collapsible subcategories (▶/▼)
- Checkbox: read status (persisted to localStorage)
- Icons: 📄 paper, 💻 code, 📝 blog, 🎮 demo
- Date (YYYY-MM) aligned right
- Click paper title → opens paper detail panel (or inline expansion)
- Multi-theme papers show badge: `+2 themes` (click to see all)

#### 3.2.3 Paper Detail View (Shared Component)

Right-side panel (similar to existing detail panel in Ilya Canon):

```
┌──────────────────────────────────────────────────────┐
│  [×] Close                                           │
│  AlphaEvolve                                         │
│  2025-06 | self-evolve, verifiers                    │
│  ──────────────────────────────────────────────────  │
│  A Gemini-powered coding agent for designing         │
│  advanced algorithms via evolutionary computation.   │
│                                                      │
│  Resources:                                          │
│  📄 Paper (arXiv)  💻 Code  📝 Blog                  │
│                                                      │
│  Also appears in:                                    │
│  [verifiers] [test-time-learning]                    │
│                                                      │
│  [Mark as Read] [Download PDF]                       │
└──────────────────────────────────────────────────────┘
```

### 3.3 Ilya Canon View (Preserved)

- Keep existing evolution tree visualization
- Update data model to use `themes[]` instead of single `thread`
- Filter bar now shows theme tags instead of thread names
- Paper cards show multi-theme badges
- Connections graph unchanged (still uses `connected[]` IDs)

### 3.4 Trending Section

Chronological list of papers from last 6 months:

```
┌──────────────────────────────────────────────────────┐
│ Trending — Recent Papers (Last 6 Months)             │
│ [Filter by theme: All | Self-Evolve | Verifiers ...] │
├──────────────────────────────────────────────────────┤
│ ▼ 2026-02                                            │
│   □ PhyloEvolve                     evo-llm    📄 💻 │
│   □ ImprovEvolve                    evo-llm    📄    │
│                                                      │
│ ▼ 2026-01                                            │
│   □ MemoryGraft                     persistent  📄   │
│   ...                                                │
└──────────────────────────────────────────────────────┘
```

Features:
- Grouped by month (collapsible)
- Most recent first
- Filter by theme
- Read checkbox
- Resource icons

---

## 4. Timeline Design (Horizontal Axis + Collapsible Cards)

### 4.1 Challenges with 280+ Papers

Original design uses horizontal timeline (year axis) + vertical lanes (threads). With 280 papers:
- Timeline becomes very wide (2011–2026 = 15 years)
- Many papers per year → dense clustering
- Vertical scrolling + horizontal scrolling = complex navigation

### 4.2 Adaptive Design Solution

**For Research Radar timeline view:**

1. **Compact Year Axis**: Each year gets fixed 120px width (vs. variable in Canon)
2. **Collapsible Year Columns**:
   ```
   [2025 (42)] [2024 (38)] [2023 (27)] ... [Expand All]
   ```
   Click to expand/collapse year → show/hide papers from that year

3. **Theme Swimlanes**: Horizontal lanes for each theme (11 lanes)
   - Papers positioned in (year, theme) grid cell
   - If paper has multiple themes, show in all relevant lanes (with visual link)

4. **Density Heatmap**: Year headers show paper count + color intensity
   - High density (>30 papers): red tint
   - Medium (10–30): yellow
   - Low (<10): green

5. **Zoom Controls**:
   - X-axis zoom: compress/expand year width (80px – 200px)
   - Y-axis zoom: compress/expand lane height (60px – 120px)

6. **Virtual Scrolling**: Only render visible year range + 1 buffer on each side

### 4.3 Card Design

Each paper is a circle node (like Ilya Canon):
- Diameter: 24px (compact) to 40px (expanded)
- Color: theme color
- Hover: tooltip with title + year + themes
- Click: open detail panel
- Read status: green checkmark overlay
- Multi-theme: dotted border + badge

---

## 5. Cross-Theme Cross-Reference Handling

### 5.1 Data Structure

Papers can appear in multiple themes via `themes: ["self-evolve", "verifiers"]`.

### 5.2 UI Handling

**Dashboard:**
- Paper counted in all relevant theme cards

**Theme Detail View:**
- Paper listed in primary theme only (first in `themes[]` array)
- Shows badge: `+2 themes` → hover to see all themes

**Timeline View:**
- Paper node appears in all relevant theme lanes
- Nodes visually linked with dotted line (SVG path)
- Hover one → highlight all instances

**Search:**
- Searching "AlphaEvolve" highlights all instances across themes

### 5.3 Deduplication Strategy

**Data Level:**
- Single paper entry in `PAPERS` array
- Each paper has unique `id`
- `themes[]` array holds all theme associations

**Display Level:**
- Filter by theme → show only papers with that theme in `themes[]`
- "All Papers" view → deduplicate by `id`

**Read Status:**
- Stored once per `id` in localStorage
- Marking read in one theme → updates all instances

---

## 6. Ilya 30 Data Migration

### 6.1 Thread → Theme Mapping

| Old Thread ID | Thread Name | New Theme Slug | New Theme Name |
|---------------|-------------|----------------|----------------|
| 1 | Attention & Transformers | `attention` | Attention & Transformers |
| 2 | Vision | `vision` | Vision |
| 3 | Sequence Models & Language | `sequence` | Sequence Models & Language |
| 4 | Optimization | `optimization` | Optimization |
| 5 | Reasoning & Memory | `memory` | Reasoning & Memory |
| 6 | Generative Models | `generative` | Generative Models |
| 7 | Scaling & Emergence | `scaling` | Scaling & Emergence |
| 8 | Meta / Philosophy | `meta` | Meta / Philosophy |

### 6.2 Multi-Theme Assignment

From EVOLUTION_MAP.md, infer additional themes for each Ilya paper:

**Examples:**
- Paper #01 (Annotated Transformer): `["attention"]` (single theme)
- Paper #14 (Attention Is All You Need): `["attention", "scaling"]` (major impact on scaling)
- Paper #22 (Scaling Laws): `["scaling", "meta"]` (both categories)

**Method:**
- Read `Connected Papers` section → infer shared themes
- Read `frontier` section → infer if related to multiple areas

### 6.3 Migration Script (Conceptual)

```javascript
const ilyaPapers = ORIGINAL_PAPERS_DATA.map(paper => ({
  ...paper,
  id: `ilya-${paper.num}`,
  collection: 'canon',
  themes: inferThemes(paper), // Multi-theme from connections
  datePublished: `${paper.year}-01`, // Default to January
  resources: [{ type: 'paper', url: paper.url || '#' }],
  status: 'unread',
  subCategory: null, // Canon doesn't use subcategories
}));
```

---

## 7. Deduplication Strategy (Same Paper in Multiple Themes)

### Problem
AlphaEvolve appears in:
- Self-Evolve (primary)
- Verifiers (secondary)
- Test-Time Learning (tertiary)

### Solution

**Data:**
```json
{
  "id": "alphaevolve",
  "themes": ["self-evolve", "verifiers", "test-time-learning"],
  "subCategory": "Evolutionary coding agents", // Primary theme's category
  ...
}
```

**UI Logic:**

1. **Dashboard**: Count toward all 3 theme cards
2. **Theme Detail View**:
   - Appears in "self-evolve" subcategory list
   - In "verifiers" and "test-time-learning" views, show as:
     ```
     ▼ Related Papers (from Self-Evolve)
       □ AlphaEvolve  [→ Self-Evolve]
     ```
3. **Timeline**: Single node, positioned in first theme lane, with dotted lines to other theme lanes
4. **Search**: Single result, showing all themes as badges

**Read Status:**
- Stored once: `localStorage.setItem('read-alphaevolve', 'true')`
- Checking in any theme marks it globally

---

## 8. Technical Implementation

### 8.1 File Structure

**Single HTML file:**
```
index.html
├── <style> (all CSS inline)
├── <script>
│   ├── const PAPERS = [...];        // Embedded data (Canon + Radar)
│   ├── const THEMES = [...];        // Theme metadata
│   ├── State management
│   ├── Rendering functions
│   ├── Event handlers
│   └── localStorage persistence
└── <body> (DOM structure)
```

### 8.2 Data Embedding

```javascript
const PAPERS = [
  // Ilya Canon (30 papers)
  { id: 'ilya-01', num: '01', title: 'Annotated Transformer', ... },
  ...
  // Research Radar (~280 papers)
  { id: 'radar-001', title: 'AlphaEvolve', collection: 'radar', ... },
  ...
];

const THEMES = [
  { slug: 'self-evolve', name: 'Self-Evolving Agents', color: '#588afd', icon: '🧬' },
  ...
];
```

### 8.3 State Management

```javascript
const state = {
  activeCollection: 'canon', // 'canon' | 'radar' | 'trending'
  activeView: 'dashboard',   // 'dashboard' | 'theme' | 'timeline' | 'tree'
  activeTheme: null,
  activePaper: null,
  searchQuery: '',
  filters: { status: 'all', priority: 'all', themes: [] },
  readStatus: {},            // Loaded from localStorage
  zoom: { x: 1.0, y: 1.0 },
};
```

### 8.4 Rendering Pipeline

1. **Router**: Tab click → update `state.activeCollection` → render view
2. **Dashboard**: Filter `PAPERS` by collection → group by theme → render cards
3. **Theme Detail**: Filter by `theme in themes[]` → group by `subCategory` → render list
4. **Timeline**: Calculate positions → render SVG connections → render nodes
5. **Detail Panel**: Fetch paper by `id` → render template

### 8.5 localStorage Schema

```javascript
{
  "ilya-papers-read-status": {
    "ilya-01": true,
    "radar-001": false,
    ...
  },
  "ilya-papers-settings": {
    "zoom-x": 1.0,
    "zoom-y": 1.0,
    "last-collection": "radar",
    "collapsed-years": ["2020", "2021"]
  }
}
```

---

## 9. Mobile Adaptation

### 9.1 Breakpoints

- Desktop: >900px → sidebar + timeline side-by-side
- Tablet: 600–900px → sidebar collapses, timeline full-width
- Mobile: <600px → dashboard cards stack, detail panel full-screen overlay

### 9.2 Mobile-Specific Changes

- **Dashboard**: 1-column grid
- **Timeline**: Not available on mobile (too complex) → fallback to list view
- **Theme Detail**: Full-screen, back button in header
- **Search**: Sticky at top
- **Detail Panel**: Swipe down to close

---

## 10. Visual Design Consistency

### 10.1 Color Palette (Preserved)

```css
--bg-deep: #0b0b0b;
--bg-surface: #111116;
--bg-card: #1b1b1b;
--text-primary: #f1f1f1;
--text-secondary: #a6a6a6;
--purple-primary: #acaaff;
--green: #0dc95c;
--orange: #fea149;
--border: rgba(153,151,255,0.2);
```

### 10.2 Typography

- **Headings**: Open Sans, 600–700 weight
- **Body**: Open Sans, 400 weight
- **Code/Data**: JetBrains Mono

### 10.3 Component Library (Reuse Existing)

- `.nav-tab` → Top navigation
- `.filter-tab` → Theme filter pills
- `.paper-node` → Timeline circles
- `.dp-*` → Detail panel components
- `.gloss-card` → Reuse for theme cards with modifications

---

## 11. Performance Considerations

### 11.1 Data Size

- ~310 papers × ~1KB/paper = 310KB JSON embedded
- Acceptable for single-page app (< 500KB total HTML)

### 11.2 Rendering Optimization

- **Virtual scrolling** for timeline (only render visible nodes)
- **Lazy load** detail panel content (render on open)
- **Debounced search** (300ms delay)
- **CSS transforms** for zoom (GPU-accelerated)

### 11.3 Build Size Target

- Total HTML size: < 600KB (gzipped < 150KB)
- Initial render: < 200ms on desktop
- Interaction latency: < 50ms (click → visual feedback)

---

## 12. Accessibility

- **Keyboard navigation**: Tab through cards, Enter to open
- **ARIA labels**: All interactive elements
- **Focus indicators**: Visible outline on focus
- **Screen reader**: Announce counts, read status changes
- **Color contrast**: WCAG AA compliance (4.5:1 for body text)

---

## 13. Future Extensions (Out of Scope for v1)

- Export to CSV/JSON
- Share URL with filters (query params)
- Annotation/notes per paper (localStorage)
- Sync read status across devices (backend)
- Auto-fetch from arXiv API (dynamic updates)
- Paper recommendations (based on read history)

---

## 14. Acceptance Criteria

✅ **Data Model**
- [ ] All 30 Ilya papers migrated with multi-theme tags
- [ ] All ~280 Radar papers converted to JSON
- [ ] No duplicate `id` values
- [ ] All `datePublished` inferred from arXiv IDs

✅ **UI**
- [ ] 3-tab navigation: Canon | Radar | Trending
- [ ] Radar dashboard with 11 theme cards
- [ ] Theme detail view with subcategory grouping
- [ ] Timeline view with horizontal year axis
- [ ] Detail panel shared across collections
- [ ] Mobile responsive (< 600px breakpoint)

✅ **Functionality**
- [ ] Search across all papers
- [ ] Filter by theme, status, priority
- [ ] Read status persisted to localStorage
- [ ] Multi-theme papers show in all relevant views
- [ ] PDF download links functional
- [ ] Zoom controls for timeline

✅ **Visual Consistency**
- [ ] Matches existing dark theme
- [ ] Same fonts, colors, spacing
- [ ] Smooth transitions (< 300ms)

✅ **Performance**
- [ ] Page load < 2s on 3G
- [ ] Smooth 60fps scrolling
- [ ] No layout shift on initial render

---

## 15. Data Conversion Guidelines

### For READING_LIST_RAW.md → JSON

1. **Extract arXiv ID from URL** → infer `datePublished`:
   - `https://arxiv.org/abs/2506.13131` → `2025-06` (YYMM format)
   - `https://arxiv.org/abs/2309.08532` → `2023-09`

2. **Assign to theme** based on section heading:
   - "Theme 1: Self-evolve" → `"themes": ["self-evolve"]`
   - Multi-theme if paper appears in multiple sections (scan full document)

3. **Assign `subCategory`** from markdown subheading:
   - "### Evolutionary coding agents" → `"subCategory": "Evolutionary coding agents"`

4. **Extract resources**:
   - arXiv link → `{ type: 'paper', url: '...' }`
   - GitHub link → `{ type: 'code', url: '...' }`
   - Blog/project page → `{ type: 'blog', url: '...' }`

5. **Generate `id`**:
   - First paper in self-evolve → `"radar-self-evolve-001"`
   - Increment within each theme
   - Use slug-friendly title if no clear ordering

6. **Default values**:
   - `status: 'unread'`
   - `priority: null` (unless marked "essential" → "high")
   - `summary: ''` (leave empty, can be filled later)

---

## End of Specification

**Next Steps:**
1. Generate `papers.json` from READING_LIST_RAW.md + EVOLUTION_MAP.md
2. Implement `index.html` following this spec
3. Test on Vercel deployment
4. Iterate based on Chris's feedback
