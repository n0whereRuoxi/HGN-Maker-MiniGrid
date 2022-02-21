( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b540 - block
    b445 - block
    b662 - block
    b965 - block
    b491 - block
    b67 - block
    b991 - block
    b793 - block
    b877 - block
    b303 - block
    b392 - block
    b702 - block
    b238 - block
    b258 - block
    b114 - block
    b908 - block
    b507 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b540 )
    ( on b445 b540 )
    ( on b662 b445 )
    ( on b965 b662 )
    ( on b491 b965 )
    ( on b67 b491 )
    ( on b991 b67 )
    ( on b793 b991 )
    ( on b877 b793 )
    ( on b303 b877 )
    ( on b392 b303 )
    ( on b702 b392 )
    ( on b238 b702 )
    ( on b258 b238 )
    ( on b114 b258 )
    ( on b908 b114 )
    ( on b507 b908 )
    ( clear b507 )
  )
  ( :goal
    ( and
      ( clear b540 )
    )
  )
)
