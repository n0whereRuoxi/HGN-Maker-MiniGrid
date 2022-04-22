( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b911 - block
    b994 - block
    b136 - block
    b514 - block
    b299 - block
    b973 - block
    b94 - block
    b396 - block
    b319 - block
    b378 - block
    b474 - block
    b277 - block
    b190 - block
    b810 - block
    b325 - block
    b594 - block
    b622 - block
    b669 - block
    b435 - block
    b291 - block
    b646 - block
    b611 - block
    b625 - block
    b951 - block
    b130 - block
    b198 - block
    b621 - block
    b608 - block
    b529 - block
    b121 - block
    b781 - block
    b227 - block
    b910 - block
    b766 - block
    b523 - block
    b226 - block
    b70 - block
    b573 - block
    b43 - block
    b210 - block
    b419 - block
    b807 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b911 )
    ( on b994 b911 )
    ( on b136 b994 )
    ( on b514 b136 )
    ( on b299 b514 )
    ( on b973 b299 )
    ( on b94 b973 )
    ( on b396 b94 )
    ( on b319 b396 )
    ( on b378 b319 )
    ( on b474 b378 )
    ( on b277 b474 )
    ( on b190 b277 )
    ( on b810 b190 )
    ( on b325 b810 )
    ( on b594 b325 )
    ( on b622 b594 )
    ( on b669 b622 )
    ( on b435 b669 )
    ( on b291 b435 )
    ( on b646 b291 )
    ( on b611 b646 )
    ( on b625 b611 )
    ( on b951 b625 )
    ( on b130 b951 )
    ( on b198 b130 )
    ( on b621 b198 )
    ( on b608 b621 )
    ( on b529 b608 )
    ( on b121 b529 )
    ( on b781 b121 )
    ( on b227 b781 )
    ( on b910 b227 )
    ( on b766 b910 )
    ( on b523 b766 )
    ( on b226 b523 )
    ( on b70 b226 )
    ( on b573 b70 )
    ( on b43 b573 )
    ( on b210 b43 )
    ( on b419 b210 )
    ( on b807 b419 )
    ( clear b807 )
  )
  ( :goal
    ( and
      ( clear b911 )
    )
  )
)
