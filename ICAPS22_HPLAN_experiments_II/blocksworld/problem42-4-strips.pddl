( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b641 - block
    b289 - block
    b420 - block
    b167 - block
    b560 - block
    b699 - block
    b400 - block
    b311 - block
    b418 - block
    b521 - block
    b398 - block
    b150 - block
    b389 - block
    b649 - block
    b599 - block
    b798 - block
    b194 - block
    b893 - block
    b569 - block
    b820 - block
    b967 - block
    b684 - block
    b456 - block
    b530 - block
    b738 - block
    b840 - block
    b162 - block
    b365 - block
    b662 - block
    b57 - block
    b636 - block
    b859 - block
    b207 - block
    b345 - block
    b463 - block
    b339 - block
    b256 - block
    b135 - block
    b19 - block
    b220 - block
    b787 - block
    b437 - block
    b827 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b641 )
    ( on b289 b641 )
    ( on b420 b289 )
    ( on b167 b420 )
    ( on b560 b167 )
    ( on b699 b560 )
    ( on b400 b699 )
    ( on b311 b400 )
    ( on b418 b311 )
    ( on b521 b418 )
    ( on b398 b521 )
    ( on b150 b398 )
    ( on b389 b150 )
    ( on b649 b389 )
    ( on b599 b649 )
    ( on b798 b599 )
    ( on b194 b798 )
    ( on b893 b194 )
    ( on b569 b893 )
    ( on b820 b569 )
    ( on b967 b820 )
    ( on b684 b967 )
    ( on b456 b684 )
    ( on b530 b456 )
    ( on b738 b530 )
    ( on b840 b738 )
    ( on b162 b840 )
    ( on b365 b162 )
    ( on b662 b365 )
    ( on b57 b662 )
    ( on b636 b57 )
    ( on b859 b636 )
    ( on b207 b859 )
    ( on b345 b207 )
    ( on b463 b345 )
    ( on b339 b463 )
    ( on b256 b339 )
    ( on b135 b256 )
    ( on b19 b135 )
    ( on b220 b19 )
    ( on b787 b220 )
    ( on b437 b787 )
    ( on b827 b437 )
    ( clear b827 )
  )
  ( :goal
    ( and
      ( clear b641 )
    )
  )
)
