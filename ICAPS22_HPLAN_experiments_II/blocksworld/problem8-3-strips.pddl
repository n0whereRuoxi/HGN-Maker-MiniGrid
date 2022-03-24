( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b839 - block
    b124 - block
    b337 - block
    b130 - block
    b417 - block
    b522 - block
    b641 - block
    b695 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b839 b795 )
    ( on b124 b839 )
    ( on b337 b124 )
    ( on b130 b337 )
    ( on b417 b130 )
    ( on b522 b417 )
    ( on b641 b522 )
    ( on b695 b641 )
    ( clear b695 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
