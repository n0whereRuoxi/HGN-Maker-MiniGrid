( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b991 - block
    b778 - block
    b268 - block
    b853 - block
    b495 - block
    b123 - block
    b293 - block
    b12 - block
    b47 - block
    b266 - block
    b226 - block
    b826 - block
    b975 - block
    b617 - block
    b450 - block
    b502 - block
    b524 - block
    b370 - block
    b160 - block
    b459 - block
    b921 - block
    b339 - block
    b753 - block
    b231 - block
    b505 - block
    b960 - block
    b533 - block
    b757 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b991 )
    ( on b778 b991 )
    ( on b268 b778 )
    ( on b853 b268 )
    ( on b495 b853 )
    ( on b123 b495 )
    ( on b293 b123 )
    ( on b12 b293 )
    ( on b47 b12 )
    ( on b266 b47 )
    ( on b226 b266 )
    ( on b826 b226 )
    ( on b975 b826 )
    ( on b617 b975 )
    ( on b450 b617 )
    ( on b502 b450 )
    ( on b524 b502 )
    ( on b370 b524 )
    ( on b160 b370 )
    ( on b459 b160 )
    ( on b921 b459 )
    ( on b339 b921 )
    ( on b753 b339 )
    ( on b231 b753 )
    ( on b505 b231 )
    ( on b960 b505 )
    ( on b533 b960 )
    ( on b757 b533 )
    ( clear b757 )
  )
  ( :goal
    ( and
      ( clear b991 )
    )
  )
)
