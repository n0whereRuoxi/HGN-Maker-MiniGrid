( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b743 - block
    b689 - block
    b987 - block
    b216 - block
    b81 - block
    b300 - block
    b620 - block
    b419 - block
    b238 - block
    b403 - block
    b7 - block
    b822 - block
    b714 - block
    b908 - block
    b868 - block
    b947 - block
    b8 - block
    b736 - block
    b756 - block
    b484 - block
    b543 - block
    b919 - block
    b169 - block
    b883 - block
    b449 - block
    b495 - block
    b466 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b743 )
    ( on b689 b743 )
    ( on b987 b689 )
    ( on b216 b987 )
    ( on b81 b216 )
    ( on b300 b81 )
    ( on b620 b300 )
    ( on b419 b620 )
    ( on b238 b419 )
    ( on b403 b238 )
    ( on b7 b403 )
    ( on b822 b7 )
    ( on b714 b822 )
    ( on b908 b714 )
    ( on b868 b908 )
    ( on b947 b868 )
    ( on b8 b947 )
    ( on b736 b8 )
    ( on b756 b736 )
    ( on b484 b756 )
    ( on b543 b484 )
    ( on b919 b543 )
    ( on b169 b919 )
    ( on b883 b169 )
    ( on b449 b883 )
    ( on b495 b449 )
    ( on b466 b495 )
    ( on b905 b466 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b743 )
    )
  )
)
