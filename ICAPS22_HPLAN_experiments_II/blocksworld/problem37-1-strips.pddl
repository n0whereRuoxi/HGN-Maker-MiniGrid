( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b992 - block
    b562 - block
    b114 - block
    b729 - block
    b461 - block
    b653 - block
    b15 - block
    b839 - block
    b685 - block
    b858 - block
    b297 - block
    b391 - block
    b848 - block
    b196 - block
    b366 - block
    b72 - block
    b597 - block
    b151 - block
    b547 - block
    b623 - block
    b910 - block
    b678 - block
    b752 - block
    b726 - block
    b197 - block
    b524 - block
    b605 - block
    b535 - block
    b342 - block
    b727 - block
    b711 - block
    b560 - block
    b309 - block
    b40 - block
    b176 - block
    b817 - block
    b545 - block
    b835 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b992 )
    ( on b562 b992 )
    ( on b114 b562 )
    ( on b729 b114 )
    ( on b461 b729 )
    ( on b653 b461 )
    ( on b15 b653 )
    ( on b839 b15 )
    ( on b685 b839 )
    ( on b858 b685 )
    ( on b297 b858 )
    ( on b391 b297 )
    ( on b848 b391 )
    ( on b196 b848 )
    ( on b366 b196 )
    ( on b72 b366 )
    ( on b597 b72 )
    ( on b151 b597 )
    ( on b547 b151 )
    ( on b623 b547 )
    ( on b910 b623 )
    ( on b678 b910 )
    ( on b752 b678 )
    ( on b726 b752 )
    ( on b197 b726 )
    ( on b524 b197 )
    ( on b605 b524 )
    ( on b535 b605 )
    ( on b342 b535 )
    ( on b727 b342 )
    ( on b711 b727 )
    ( on b560 b711 )
    ( on b309 b560 )
    ( on b40 b309 )
    ( on b176 b40 )
    ( on b817 b176 )
    ( on b545 b817 )
    ( on b835 b545 )
    ( clear b835 )
  )
  ( :goal
    ( and
      ( clear b992 )
    )
  )
)
