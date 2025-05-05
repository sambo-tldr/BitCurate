;; Title: BitCurate - Decentralized Content Curation Protocol
;;
;; Summary: A trustless content curation system powered by Stacks and anchored to Bitcoin
;;
;; Description:
;; BitCurate is a transparent, community-driven content curation protocol that leverages
;; the security of Bitcoin through Stacks Layer 2. The protocol allows users to submit,
;; appraise, and reward high-quality content across various topics while building
;; reputation within the ecosystem. Contributors stake STX for submissions, creating
;; economic incentives against spam and low-quality content. The protocol's consensus
;; mechanisms prioritize discovery of valuable information without central authorities.

;; Constants and Error Codes


;; Core Constants
(define-constant PROTOCOL_ADMINISTRATOR tx-sender)

;; Error Codes
(define-constant ERR_UNAUTHORIZED_ACCESS (err u100))
(define-constant ERR_INVALID_SUBMISSION (err u101))
(define-constant ERR_DUPLICATE_ENTRY (err u102))
(define-constant ERR_NONEXISTENT_ITEM (err u103))
(define-constant ERR_INADEQUATE_BALANCE (err u104))
(define-constant ERR_INVALID_TOPIC (err u105))
(define-constant ERR_INVALID_FLAG (err u106))
(define-constant ERR_OVERFLOW (err u107))
(define-constant ERR_INVALID_APPRAISAL (err u108))
(define-constant ERR_INVALID_ITEM_ID (err u109))

;; Protocol Parameters
(define-constant MIN_HYPERLINK_LENGTH u10)
(define-constant MAX_UINT u340282366920938463463374607431768211455)

;; State Variables

(define-data-var submission-charge uint u10)
(define-data-var aggregate-submissions uint u0)
(define-data-var content-topics (list 10 (string-ascii 20)) (list "Technology" "Science" "Art" "Politics" "Sports"))


;; Data Storage

(define-map curated-items 
  { item-identifier: uint } 
  { 
    originator: principal, 
    headline: (string-ascii 100), 
    hyperlink: (string-ascii 200), 
    topic: (string-ascii 20),
    publication-epoch: uint, 
    appraisals: int,
    gratuities: uint,
    flags: uint
  }
)

(define-map participant-appraisals 
  { participant: principal, item-identifier: uint } 
  { appraisal: int }
)

(define-map participant-credibility
  { participant: principal }
  { metric: int }
)

;; Private Helper Functions

;; Check if an item exists in the curation database
(define-private (item-exists (item-identifier uint))
  (is-some (map-get? curated-items { item-identifier: item-identifier }))
)

;; Filter valid items for top content retrieval
(define-private (not-none (item (optional {
    originator: principal, 
    headline: (string-ascii 100), 
    hyperlink: (string-ascii 200), 
    topic: (string-ascii 20),
    publication-epoch: uint, 
    appraisals: int,
    gratuities: uint,
    flags: uint
  })))
  (is-some item)
)