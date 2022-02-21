( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b42 - block
    b93 - block
    b550 - block
    b47 - block
    b941 - block
    b811 - block
    b878 - block
    b588 - block
    b507 - block
    b516 - block
    b48 - block
    b289 - block
    b620 - block
    b619 - block
    b487 - block
    b767 - block
    b658 - block
    b683 - block
    b387 - block
    b965 - block
    b879 - block
    b97 - block
    b363 - block
    b480 - block
    b717 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b42 )
    ( on b93 b42 )
    ( on b550 b93 )
    ( on b47 b550 )
    ( on b941 b47 )
    ( on b811 b941 )
    ( on b878 b811 )
    ( on b588 b878 )
    ( on b507 b588 )
    ( on b516 b507 )
    ( on b48 b516 )
    ( on b289 b48 )
    ( on b620 b289 )
    ( on b619 b620 )
    ( on b487 b619 )
    ( on b767 b487 )
    ( on b658 b767 )
    ( on b683 b658 )
    ( on b387 b683 )
    ( on b965 b387 )
    ( on b879 b965 )
    ( on b97 b879 )
    ( on b363 b97 )
    ( on b480 b363 )
    ( on b717 b480 )
    ( clear b717 )
  )
  ( :goal
    ( and
      ( clear b42 )
    )
  )
)
