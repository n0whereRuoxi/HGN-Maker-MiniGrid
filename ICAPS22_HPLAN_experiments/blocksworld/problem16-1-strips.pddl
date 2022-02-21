( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b491 - block
    b16 - block
    b772 - block
    b833 - block
    b359 - block
    b747 - block
    b919 - block
    b251 - block
    b641 - block
    b69 - block
    b178 - block
    b158 - block
    b850 - block
    b658 - block
    b973 - block
    b12 - block
    b42 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b491 )
    ( on b16 b491 )
    ( on b772 b16 )
    ( on b833 b772 )
    ( on b359 b833 )
    ( on b747 b359 )
    ( on b919 b747 )
    ( on b251 b919 )
    ( on b641 b251 )
    ( on b69 b641 )
    ( on b178 b69 )
    ( on b158 b178 )
    ( on b850 b158 )
    ( on b658 b850 )
    ( on b973 b658 )
    ( on b12 b973 )
    ( on b42 b12 )
    ( clear b42 )
  )
  ( :goal
    ( and
      ( clear b491 )
    )
  )
)
