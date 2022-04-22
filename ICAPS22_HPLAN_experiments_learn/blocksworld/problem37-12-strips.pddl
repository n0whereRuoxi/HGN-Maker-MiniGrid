( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b599 - block
    b418 - block
    b380 - block
    b150 - block
    b793 - block
    b721 - block
    b321 - block
    b662 - block
    b114 - block
    b590 - block
    b108 - block
    b919 - block
    b308 - block
    b741 - block
    b281 - block
    b538 - block
    b323 - block
    b395 - block
    b807 - block
    b398 - block
    b48 - block
    b315 - block
    b563 - block
    b232 - block
    b31 - block
    b482 - block
    b96 - block
    b909 - block
    b324 - block
    b645 - block
    b436 - block
    b353 - block
    b565 - block
    b299 - block
    b557 - block
    b123 - block
    b189 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b599 b91 )
    ( on b418 b599 )
    ( on b380 b418 )
    ( on b150 b380 )
    ( on b793 b150 )
    ( on b721 b793 )
    ( on b321 b721 )
    ( on b662 b321 )
    ( on b114 b662 )
    ( on b590 b114 )
    ( on b108 b590 )
    ( on b919 b108 )
    ( on b308 b919 )
    ( on b741 b308 )
    ( on b281 b741 )
    ( on b538 b281 )
    ( on b323 b538 )
    ( on b395 b323 )
    ( on b807 b395 )
    ( on b398 b807 )
    ( on b48 b398 )
    ( on b315 b48 )
    ( on b563 b315 )
    ( on b232 b563 )
    ( on b31 b232 )
    ( on b482 b31 )
    ( on b96 b482 )
    ( on b909 b96 )
    ( on b324 b909 )
    ( on b645 b324 )
    ( on b436 b645 )
    ( on b353 b436 )
    ( on b565 b353 )
    ( on b299 b565 )
    ( on b557 b299 )
    ( on b123 b557 )
    ( on b189 b123 )
    ( clear b189 )
  )
  ( :goal
    ( and
      ( clear b91 )
    )
  )
)
