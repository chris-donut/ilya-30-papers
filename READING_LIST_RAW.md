# Chris's Active Research Radar — Raw Reading List

Received: 2026-02-20

## Theme 1: Self-evolve

### Evolutionary coding agents / discovery systems
- AlphaEvolve (white paper): https://arxiv.org/abs/2506.13131
- AlphaEvolve (DeepMind blog): https://deepmind.google/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/
- Mathematical exploration at scale (AlphaEvolve experiments): https://arxiv.org/abs/2511.02864
- Terence Tao blog discussion + pitfalls: https://terrytao.wordpress.com/2025/11/05/mathematical-exploration-and-discovery-at-scale/
- LoongFlow (Plan–Execute–Summarize + hybrid evolutionary memory): https://arxiv.org/abs/2512.24077
- LoongFlow HTML: https://arxiv.org/html/2512.24077v1
- ShinkaEvolve (sample-efficient program evolution): https://arxiv.org/abs/2509.19349
- ShinkaEvolve Code: https://github.com/SakanaAI/ShinkaEvolve
- ShinkaEvolve Blog: https://sakana.ai/shinka-evolve/
- OpenEvolve (open-source AlphaEvolve-style): https://github.com/algorithmicsuperintelligence/openevolve
- ThetaEvolve (test-time learning on open problems): https://arxiv.org/abs/2511.23473
- AFlow (workflow search via MCTS over code-represented agentic graphs): https://arxiv.org/abs/2410.10762
- AFlow Code: https://github.com/FoundationAgents/AFlow

### Self-evolving agents (MCP/tool/module synthesis + co-evolution)
- Alita (minimal predefinition + maximal self-evolution; MCP generation/reuse): https://arxiv.org/abs/2505.20286
- Alita Code: https://github.com/CharlesQ9/Alita
- AgentDistill (training-free agent distillation via reusable "MCP boxes"): https://arxiv.org/abs/2506.14728
- Survey (taxonomy + evaluation + failure modes; TMLR 01/2026): https://arxiv.org/abs/2507.21046
- Survey Repo: https://github.com/CharlesQ9/Self-Evolving-Agents
- AgentEvolver (self-questioning + self-navigating + self-attributing): https://arxiv.org/abs/2511.10395
- AgentEvolver Repo: https://github.com/modelscope/AgentEvolver
- AutoAgents (auto-generate + coordinate task-specific team): https://arxiv.org/abs/2309.17288
- AutoAgents Code: https://github.com/Link-AGI/AutoAgents
- Agent0 (curriculum agent vs executor agent co-evolution): https://arxiv.org/abs/2511.16043
- Agent0 Code: https://github.com/aiming-lab/Agent0

### Co-evolving evaluators / critics / judges
- ECHO (co-evolving critic for open-world agent learning): https://arxiv.org/abs/2601.06794
- Multi-Agent Evolve (Proposer/Solver/Judge co-evolution + RL): https://arxiv.org/abs/2510.23595
- Generative Adversarial Reasoner (co-evolving reasoner + discriminator): https://arxiv.org/abs/2512.16917

### Further works citing Alita
- Live-Evo: https://arxiv.org/abs/2602.02369
- Bifrost: https://arxiv.org/abs/2602.05810
- Yunjue Agent: https://arxiv.org/abs/2601.18226
- Alignment Tipping Process / ATP: https://arxiv.org/abs/2510.04860
- AlphaApollo: https://arxiv.org/abs/2510.06261

### Self-evolving memory systems
- MemEvolve: https://arxiv.org/abs/2512.18746
- MemGen: https://arxiv.org/abs/2509.24704
- A-MEM: https://arxiv.org/abs/2502.12110
- A-MEM Eval: https://github.com/WujiangXu/A-mem
- A-MEM System: https://github.com/WujiangXu/A-mem-sys

### Verifier/critic assistance
- LLM Critics Help Catch LLM Bugs: https://arxiv.org/abs/2407.00215

### MCP security
- MCP Security Bench: https://arxiv.org/abs/2510.15994
- MCP landscape + threat taxonomy + safeguards: https://arxiv.org/abs/2503.23278

### Self-evolving SE agents
- Live-SWE-agent: https://arxiv.org/abs/2511.13646
- SE-Agent: https://arxiv.org/abs/2508.02085

### Web agents via skill libraries
- SkillWeaver: https://arxiv.org/abs/2504.07079

### Self-generated tasks w/ verifiable feedback
- Self-Challenging Language Model Agents (Code-as-Task): https://arxiv.org/abs/2506.01716

## Theme 2: Verifiers as scaling lever
- Training Verifiers to Solve Math Word Problems: https://arxiv.org/abs/2110.14168

## Theme 3: Adjacent (science agents)
- Physics Supernova: https://arxiv.org/abs/2509.01659
- Physics Supernova Code: https://github.com/CharlesQ9/Physics-Supernova
- LabOS: https://arxiv.org/abs/2510.14861

## Theme 4: Memory / reflection primitives
- Reflexion: https://arxiv.org/abs/2303.11366
- ReAct: https://arxiv.org/abs/2210.03629
- MAP-Elites: https://arxiv.org/abs/1504.04909
- Voyager: https://arxiv.org/abs/2305.16291
- ExpeL: https://arxiv.org/abs/2308.10144
- CRITIC: https://arxiv.org/abs/2305.11738

## Theme 5: Test-time learning / parameter adaptation
- TTT: https://arxiv.org/abs/2411.07279
- TLM / TTL for LLMs: https://arxiv.org/abs/2505.20633
- TTT-E2E: https://arxiv.org/abs/2512.23675
- LoRA-TTT: https://arxiv.org/abs/2502.02069
- Tent: https://arxiv.org/abs/2006.10726
- Darwin Gödel Machine / DGM: https://arxiv.org/abs/2505.22954
- Test-Time Tool Evolution / TTE + SciEvo: https://arxiv.org/abs/2601.07641
- FLEX: https://arxiv.org/abs/2511.06449
- WebCoach: https://arxiv.org/abs/2511.12997
- CASCADE: https://arxiv.org/abs/2512.23880

## Theme 6: Spawn / multi-agent orchestration

### Core multi-agent orchestration systems
- AgentOrchestra TEA protocol: https://arxiv.org/abs/2506.12508
- Lemon Agent (AgentCortex): https://arxiv.org/abs/2602.07092
- Puppeteer-style RL orchestrator: https://arxiv.org/abs/2505.19591
- OPERA: https://arxiv.org/abs/2508.16438
- ORCH: https://arxiv.org/abs/2602.01797
- CASTER: https://arxiv.org/abs/2601.19793

### Communication protocols
- TalkHier: https://arxiv.org/abs/2502.11098
- SEMAP: https://arxiv.org/abs/2510.12120
- AgentNet++: https://arxiv.org/abs/2512.00614
- Internet of Agents / IoA: https://arxiv.org/abs/2407.07061
- E-mem: https://arxiv.org/abs/2601.21714

### Fault tolerance and failure analysis
- MAST: https://arxiv.org/abs/2503.13657
- MAST Project: https://sky.cs.berkeley.edu/project/mast/
- CP-WBFT: https://arxiv.org/abs/2511.10400
- Who&When: https://arxiv.org/abs/2505.00212
- MTTR-A: https://arxiv.org/abs/2511.20663
- MyAntFarm: https://arxiv.org/abs/2511.15755

### Security and trust
- Aura agent OS: https://arxiv.org/abs/2602.10915
- TRiSM for Agentic AI: https://arxiv.org/abs/2506.04133
- SEMAP behavioral contracts: https://arxiv.org/abs/2510.12120

### Multi-agent distillation
- AgentArk: https://arxiv.org/abs/2602.03955
- Chain-of-Agents: https://arxiv.org/abs/2508.13167
- MapCoder-Lite: https://arxiv.org/abs/2509.17489

### Scaling laws
- Towards a Science of Scaling Agent Systems: https://arxiv.org/abs/2512.08296
- Difficulty-aware orchestration: https://arxiv.org/abs/2509.11079
- LLM-powered swarm intelligence: https://arxiv.org/abs/2503.03800

### Surveys
- LLM-MAS collaboration survey: https://arxiv.org/abs/2501.06322
- Communication-centric survey: https://arxiv.org/abs/2502.14321
- Agentic AI survey: https://arxiv.org/abs/2601.12560

### Frameworks (open-source)
- CrewAI: https://github.com/crewAIInc/crewAI
- LangGraph: https://github.com/langchain-ai/langgraph
- AutoGen / AG2: https://github.com/microsoft/autogen / https://github.com/ag2ai/ag2
- OpenClaw: https://github.com/openclaw/openclaw

### Production (non-paper)
- Anthropic — Building Effective Agents: https://www.anthropic.com/engineering/building-effective-agents
- MAST project page: https://sky.cs.berkeley.edu/project/mast/

### Benchmarks
- ETOM: https://arxiv.org/abs/2510.19423

### Added 2026-02-18 (evolutionary spawn + infrastructure)
- Conway Research / Automaton: https://github.com/Conway-Research/automaton
- WEB 4.0 essay: https://web4.ai
- Conway Terminal: https://www.npmjs.com/package/conway-terminal
- x402 protocol: https://x402.org
- OpenX402: https://openx402.ai
- ERC-8004: https://ethereum-magicians.org/t/erc-8004-autonomous-agent-identity/22268

## Theme 7: Proactive Agents

### Foundational benchmarks
- ProactiveBench: https://arxiv.org/abs/2410.12361
- ProAgentBench: https://arxiv.org/abs/2602.04482
- PROBE: https://arxiv.org/abs/2510.19771

### Training paradigms
- PPP Training: https://arxiv.org/abs/2511.02208
- BAO: https://arxiv.org/abs/2602.11351
- 1,000 Personas: https://arxiv.org/abs/2602.04000

### Proactive retrieval (push-based RAG)
- FLARE: https://arxiv.org/abs/2305.06983
- Self-RAG: https://arxiv.org/abs/2310.11511
- ProCIS: https://arxiv.org/abs/2405.06460

### Proactive clarification & intent inference
- PIR: https://arxiv.org/abs/2601.22139
- PersonalAlign: https://arxiv.org/abs/2601.09636

### Context-aware & sensory proactive agents
- ContextAgent: https://arxiv.org/abs/2505.14668
- ProAgent-Sensory: https://arxiv.org/abs/2512.06721

### Timing & interaction design
- Goldilocks Time Window: https://arxiv.org/abs/2504.09332
- ComPeer: https://arxiv.org/abs/2407.18064

### Autonomous goal generation
- Voyager: https://arxiv.org/abs/2305.16291

### Production deployment evidence
- Devin 2025 Performance Review: https://cognition.ai/blog/devin-annual-performance-review-2025
- Anthropic — How AI Is Transforming Work: https://www.anthropic.com/research/how-ai-is-transforming-work-at-anthropic
- ChatGPT Scheduled Tasks: https://openai.com/index/introducing-chatgpt-agent/

### Surveys & taxonomies
- Proactive Conversational AI (ACM TOIS 2025): https://dl.acm.org/doi/10.1145/3715097
- Agentic RAG Survey: https://arxiv.org/abs/2501.09136

### Systems infrastructure
- Agent.xpu: https://arxiv.org/abs/2506.24045

## Theme 8: Agent Persistent Memory

### Essential reading
1. Memory in the Age of AI Agents: https://arxiv.org/abs/2512.13564
2. MemGPT: https://arxiv.org/abs/2310.08560
   - Code: https://github.com/letta-ai/letta
3. HippoRAG: https://arxiv.org/abs/2405.14831
4. Beyond Heuristics (decision-theoretic forgetting): https://arxiv.org/abs/2512.21567
5. MemoryGraft (poisoned experience retrieval): https://arxiv.org/abs/2512.16962

### Architecture & organization
6. A-MEM: https://arxiv.org/abs/2502.12110
   - Code: https://github.com/WujiangXu/A-mem
7. Mem0: https://arxiv.org/abs/2504.19413

### Evaluation & benchmarks
8. MemoryAgentBench: https://arxiv.org/abs/2507.05257

### Temporal & graph memory
9. Zep (temporal knowledge graph memory): https://arxiv.org/abs/2501.13956

### Security
10. Memory Poisoning Attack and Defense: https://arxiv.org/abs/2601.05504

### Surveys
- Survey on memory mechanism of LLM-based agents: https://arxiv.org/abs/2404.13501

### Production perspectives
- Anthropic — Building Effective Agents: https://www.anthropic.com/engineering/building-effective-agents
- Salesforce Agentic Memory: https://engineering.salesforce.com/how-agentic-memory-enables-durable-reliable-ai-agents-across-millions-of-enterprise-users/

### Deeper dives
- MemoryBank: https://arxiv.org/abs/2305.10250
- R³Mem: https://arxiv.org/abs/2502.15957
- MemFly: https://arxiv.org/abs/2602.07885

### RL-learned memory management
- Memory-R1: https://arxiv.org/abs/2508.19828
- Mem-α: https://arxiv.org/abs/2509.25911

### Context-window motivation
- Lost in the Middle: https://arxiv.org/abs/2307.03172

### To add (next pass)
- MAGMA: https://arxiv.org/abs/2601.03236
- TAME: https://arxiv.org/abs/2602.03224
- MemBench: https://arxiv.org/abs/2506.21605
- LoCoMo-Plus: https://arxiv.org/abs/2602.10715

## Theme 9: Human-agent interaction

### Core interaction frameworks & surveys
- LLM-HAS Survey (Zou et al.): https://arxiv.org/abs/2505.00753
- LLM-HAS Position Paper: https://arxiv.org/abs/2506.09420
- Interaction as Intelligence: https://arxiv.org/abs/2507.15759

### Human-centered agent interfaces
- Magentic-UI: https://arxiv.org/abs/2507.22358
- Magentic-UI Blog: https://www.microsoft.com/en-us/research/blog/magentic-ui-an-experimental-human-centered-web-agent/
- Magentic-UI Code: https://github.com/microsoft/magentic-ui
- AIPOM: https://arxiv.org/abs/2509.24826
- ARIA: https://arxiv.org/abs/2507.17131

### Intent elicitation & clarification
- ACT: https://arxiv.org/abs/2406.00222
- MAC: https://arxiv.org/abs/2512.13154
- ProactiveBench: https://arxiv.org/abs/2410.12361
- PersonalAlign: https://arxiv.org/abs/2601.09636
- PrefIx: https://arxiv.org/abs/2602.06714

### Autonomy control & empowerment
- Empower: https://arxiv.org/abs/2510.13709
- PPP training: https://arxiv.org/abs/2511.02208
- UserRL: https://arxiv.org/abs/2509.19736
- Mode-switching study: https://arxiv.org/abs/2509.20666
- RLTHF: https://arxiv.org/abs/2502.13417

### Collaborative training & step-wise eval
- SWEET-RL: https://arxiv.org/abs/2503.15478
- Collaborative Gym / Co-Gym: https://arxiv.org/abs/2412.15701

### Evaluation methodology
- τ²-bench: https://arxiv.org/abs/2506.07982
- HAI-Eval: https://arxiv.org/abs/2512.04111
- SPHERE: https://arxiv.org/abs/2504.07971
- How can we assess human-agent interactions?: https://arxiv.org/abs/2510.09801

### Trust calibration & explanation
- Behzad et al.: https://arxiv.org/abs/2508.09033
- Interpreting Agentic Systems: https://arxiv.org/abs/2601.17168
- XAgen: https://arxiv.org/abs/2512.17896
- Echoing paper: https://arxiv.org/abs/2511.09710

### Staged autonomy & safety
- Three-Pillar Model: https://arxiv.org/abs/2601.06223
- EmoAgent: https://arxiv.org/abs/2504.09689
- RLHF Trilemma: https://arxiv.org/abs/2511.19504
- 6-month AI peer RCT: https://arxiv.org/abs/2602.01918

### HITL practice
- ICSE 2025 HITL study: https://arxiv.org/abs/2411.12924
- Anthropic — Building Effective Agents: https://www.anthropic.com/engineering/building-effective-agents

### Design guidelines
- 18 Guidelines for Human-AI Interaction (CHI 2019): https://www.microsoft.com/en-us/research/project/guidelines-for-human-ai-interaction/

## Theme 10: World models for agents

### Core "LLM-as-world-model" papers
- WebDreamer: https://arxiv.org/abs/2411.06559
- DynaWeb: https://arxiv.org/abs/2601.22149
- RWML: https://arxiv.org/abs/2602.05842
- UI-Simulator: https://arxiv.org/abs/2510.14969
- INTENT: https://arxiv.org/abs/2602.11541

### Latent dynamics / MBRL
- DreamerV3 (Nature): https://www.nature.com/articles/s41586-025-08744-2
- State-Space World Models: https://arxiv.org/abs/2502.20168
- RWM-U: https://arxiv.org/abs/2504.16680
- GW-Dreamer: https://arxiv.org/abs/2502.21142
- VLWM: https://arxiv.org/abs/2509.02722

### Hybrid symbolic + latent
- WorldMind: https://arxiv.org/abs/2601.13247
- Agent2World: https://arxiv.org/abs/2512.22336
- Object-centric causality-aware modeling: https://arxiv.org/abs/2511.14262

### Video generative world models
- Cosmos WFM (NVIDIA): https://arxiv.org/abs/2501.03575
- Cosmos-Predict2.5: https://arxiv.org/abs/2511.00062
- Genie 3 (blog): https://deepmind.google/blog/genie-3-a-new-frontier-for-world-models/
- Genie Envisioner: https://arxiv.org/abs/2508.05635
- World-Gymnast: https://arxiv.org/abs/2602.02454
- WorldVLA: https://arxiv.org/abs/2506.21539
- DriveVLA-W0: https://arxiv.org/abs/2510.12796
- LingBot-World: https://arxiv.org/abs/2601.20540
- World4RL: https://arxiv.org/abs/2509.19080
- RLVR-World: https://arxiv.org/abs/2505.13934

### JEPA / latent prediction
- LeCun JEPA position: https://openreview.net/pdf?id=BZ5a1r-kVsf
- V-JEPA: https://arxiv.org/abs/2404.08471
- V-JEPA 2: https://arxiv.org/abs/2506.09985

### Evaluation and verification
- ARTIS: https://arxiv.org/abs/2602.01709
- ViSA: https://arxiv.org/abs/2512.05809
- Benchmarking World-Model Learning: https://arxiv.org/abs/2510.19788
- Epistemic querying: https://arxiv.org/abs/2602.03974

### Surveys and frameworks
- World Models for Embodied AI (survey): https://arxiv.org/abs/2510.16732
- Understanding World or Predicting Future? (CSUR taxonomy): https://arxiv.org/abs/2411.14499
- A Step Toward World Models: Robot Manipulation (survey): https://arxiv.org/abs/2511.02097
- Embodied AI Agents: Modeling the World (framework): https://arxiv.org/abs/2506.22355
- Digital Twin AI: https://arxiv.org/abs/2601.01321

### Sim-to-real and grounding
- Mixed-Reality Digital Twins: https://arxiv.org/abs/2403.10996
- Agents underuse world models for foresight: https://arxiv.org/abs/2601.03905
- Bayesian filtering frame for LLM decision loops: https://arxiv.org/abs/2512.18489
- Quantization of world models: https://arxiv.org/abs/2602.02110

### Adjacent
- VLM RL in Synthetic Worlds: https://arxiv.org/abs/2508.04280
- Test-time mixtures of world models: https://arxiv.org/abs/2601.22647
- Atomic Fact Augmentation + Lookahead Search: https://arxiv.org/abs/2506.09171

## Theme 11: Evo-LLM

### Direction 1: EC → LLM
- EvoPrompt: https://arxiv.org/abs/2309.08532
- Promptbreeder: https://arxiv.org/abs/2309.16797
- Evolutionary model merging (Sakana AI): https://arxiv.org/abs/2403.13187
- CycleQD (QD-based model merging): https://arxiv.org/abs/2410.14735
- M2N2 (niche-based model evolution): https://arxiv.org/abs/2508.16204
- DEEVO / Tournament of Prompts: https://arxiv.org/abs/2506.00178
- ARTEMIS: https://arxiv.org/abs/2512.09108
- Evolution Strategies at Scale: https://arxiv.org/abs/2509.24372

### Direction 2: LLM → EC
- Evolution through Large Models / ELM: https://arxiv.org/abs/2206.08896
- Language Model Crossover / LMX: https://arxiv.org/abs/2302.12170
- FunSearch (Nature 2024): https://www.nature.com/articles/s41586-023-06924-6
- AlphaEvolve: https://arxiv.org/abs/2506.13131
- CodeEvolve: https://arxiv.org/abs/2510.14150
- QDAIF: https://arxiv.org/abs/2310.13032
- Eureka: https://arxiv.org/abs/2310.12931
- LLMs As Evolution Strategies: https://arxiv.org/abs/2402.18381
- Can LLMs Be Trusted as Evolutionary Optimizers?: https://arxiv.org/abs/2501.15081
- TTT-Discover: https://arxiv.org/abs/2601.16175

### Direction 3: Co-evolutionary / Open-ended
- Darwin Gödel Machine / DGM: https://arxiv.org/abs/2505.22954
- ASAL: https://arxiv.org/abs/2412.17799
- The AI Scientist: https://arxiv.org/abs/2408.06292
- ShinkaEvolve: https://arxiv.org/abs/2509.19349
- LoongFlow: https://arxiv.org/abs/2512.24077
- DeepEvolve: https://arxiv.org/abs/2510.06056

### Surveys
- Evolutionary Computation in the Era of LLM: https://arxiv.org/abs/2401.10034
- When LLMs Meet EA: https://arxiv.org/abs/2401.10510
- EC and LLM: Methods, Synergies, and Applications: https://arxiv.org/abs/2505.15741
- LLMs for Algorithm Design: https://arxiv.org/abs/2410.14716

### Open-source frameworks
- OpenEvolve: https://github.com/algorithmicsuperintelligence/openevolve
- OpenELM: https://github.com/CarperAI/OpenELM
- ShinkaEvolve: https://github.com/SakanaAI/ShinkaEvolve

### Recent additions (Feb 2026)
- PhyloEvolve: https://arxiv.org/abs/2601.14523
- ImprovEvolve: https://arxiv.org/abs/2602.10233
- Sparsity-Aware Evolution: https://arxiv.org/abs/2602.08218
- Transport and Merge: https://arxiv.org/abs/2602.05495
- CCTS: https://arxiv.org/abs/2602.03132
- Landscape-aware Automated Algorithm Design: https://arxiv.org/abs/2602.04529
- Position: Agentic Evolution is the Path to Evolving LLMs: https://arxiv.org/abs/2602.00359
