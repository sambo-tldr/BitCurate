# BitCurate - Decentralized Content Curation Protocol

[![Built with Clarity](https://img.shields.io/badge/Built%20With-Clarity-blue)](https://clarity-lang.org/)
[![Powered by Stacks](https://img.shields.io/badge/Powered%20By-Stacks-5546ff)](https://www.stacks.co/)

BitCurate is a revolutionary decentralized protocol for community-driven content curation anchored to Bitcoin's security through Stacks Layer 2. This trustless system enables transparent content submission, appraisal, and reward distribution while maintaining anti-spam mechanisms and reputation tracking.

## Key Features

- **Staked Content Submission**  
  Users stake STX tokens to submit content, creating economic barriers against spam
- **Decentralized Voting System**  
  Community members appraise content with (+1/-1) votes affecting content visibility
- **Creator Rewards**  
  Direct STX token gratuities to content creators through seamless in-protocol transfers
- **Reputation Governance**  
  Dynamic credibility scores for participants based on voting history
- **Multi-Topic Support**  
  Curated content categories including Technology, Science, Art, Politics, and Sports
- **Anti-Abuse Mechanisms**  
  Collective flagging system and administrative oversight for content moderation
- **Bitcoin-Secured**  
  Leverages Bitcoin finality through Stacks L2 for tamper-proof operations

## Technical Architecture

### Core Components
- **curated-items**  
  Primary storage map for content metadata including votes, rewards, and flags
- **participant-credibility**  
  Reputation tracking system with dynamic score adjustments
- **content-topics**  
  Managed list of supported curation categories
- **STX Token Flow**  
  Dual economic model with submission fees and direct creator rewards

### Key Constants

```clarity
PROTOCOL_ADMINISTRATOR     # Admin address with governance privileges
MIN_HYPERLINK_LENGTH 10   # Minimum URL length requirement
SUBMISSION_CHARGE    10   # Base STX fee for content submission
```

## Protocol Functions

### User Operations

- **`contribute-item`**  
  Submit new content with STX stake (Headline, URL, Topic)
- **`appraise-item`**  
  Vote (+1/-1) on content items affecting visibility and reputation
- **`reward-originator`**  
  Send STX gratuities directly to content creators
- **`flag-item`**  
  Report inappropriate content to moderation system

### Query Operations

- **`retrieve-top-items`**  
  Get highest-ranked content based on community votes
- **`retrieve-item-details`**  
  View complete metadata for specific content entries
- **`retrieve-participant-credibility`**  
  Check reputation score for any network participant

### Administrative Functions

- **`adjust-submission-charge`**  
  Update STX submission fee (Admin only)
- **`introduce-topic`**  
  Add new content categories (Admin only)
- **`expunge-item`**  
  Remove malicious content (Admin only)

## Economic Model

1. **Submission Costs**  
   Users pay STX fee to submit content (anti-spam mechanism)
2. **Voting Incentives**  
   Participants earn reputation for consistent quality appraisals
3. **Direct Rewards**  
   Community members can send STX directly to creators
4. **Fee Distribution**  
   Submission fees go to protocol maintenance fund

## Error Handling

| Error Code | Description                      |
|------------|----------------------------------|
| ERR_UNAUTHORIZED_ACCESS (u100) | Administrative privilege violation |
| ERR_INVALID_SUBMISSION (u101) | Malformed content submission       |
| ERR_INADEQUATE_BALANCE (u104) | Insufficient STX for operation     |
| ERR_INVALID_APPRAISAL (u108) | Invalid voting attempt              |

## Development Roadmap

- [ ] Phase 1: Core Protocol Deployment
- [ ] Phase 2: Reputation-Based Voting Weighting
- [ ] Phase 3: Automated Reward Distribution Pool
- [ ] Phase 4: Cross-Protocol Integration Hooks
