( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b72 - block
    b788 - block
    b265 - block
    b717 - block
    b958 - block
    b87 - block
    b291 - block
    b305 - block
    b558 - block
    b58 - block
    b565 - block
    b825 - block
    b847 - block
    b93 - block
    b962 - block
    b894 - block
    b363 - block
    b463 - block
    b719 - block
    b812 - block
    b837 - block
    b723 - block
    b741 - block
    b536 - block
    b288 - block
    b97 - block
    b986 - block
    b564 - block
    b317 - block
    b432 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b72 )
    ( on b788 b72 )
    ( on b265 b788 )
    ( on b717 b265 )
    ( on b958 b717 )
    ( on b87 b958 )
    ( on b291 b87 )
    ( on b305 b291 )
    ( on b558 b305 )
    ( on b58 b558 )
    ( on b565 b58 )
    ( on b825 b565 )
    ( on b847 b825 )
    ( on b93 b847 )
    ( on b962 b93 )
    ( on b894 b962 )
    ( on b363 b894 )
    ( on b463 b363 )
    ( on b719 b463 )
    ( on b812 b719 )
    ( on b837 b812 )
    ( on b723 b837 )
    ( on b741 b723 )
    ( on b536 b741 )
    ( on b288 b536 )
    ( on b97 b288 )
    ( on b986 b97 )
    ( on b564 b986 )
    ( on b317 b564 )
    ( on b432 b317 )
    ( clear b432 )
  )
  ( :goal
    ( and
      ( clear b72 )
    )
  )
)
