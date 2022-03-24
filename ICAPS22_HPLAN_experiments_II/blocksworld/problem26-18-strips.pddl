( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b171 - block
    b181 - block
    b237 - block
    b4 - block
    b42 - block
    b905 - block
    b518 - block
    b486 - block
    b755 - block
    b880 - block
    b299 - block
    b569 - block
    b281 - block
    b801 - block
    b207 - block
    b797 - block
    b870 - block
    b885 - block
    b9 - block
    b645 - block
    b419 - block
    b529 - block
    b135 - block
    b858 - block
    b970 - block
    b491 - block
    b541 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b171 )
    ( on b181 b171 )
    ( on b237 b181 )
    ( on b4 b237 )
    ( on b42 b4 )
    ( on b905 b42 )
    ( on b518 b905 )
    ( on b486 b518 )
    ( on b755 b486 )
    ( on b880 b755 )
    ( on b299 b880 )
    ( on b569 b299 )
    ( on b281 b569 )
    ( on b801 b281 )
    ( on b207 b801 )
    ( on b797 b207 )
    ( on b870 b797 )
    ( on b885 b870 )
    ( on b9 b885 )
    ( on b645 b9 )
    ( on b419 b645 )
    ( on b529 b419 )
    ( on b135 b529 )
    ( on b858 b135 )
    ( on b970 b858 )
    ( on b491 b970 )
    ( on b541 b491 )
    ( clear b541 )
  )
  ( :goal
    ( and
      ( clear b171 )
    )
  )
)
