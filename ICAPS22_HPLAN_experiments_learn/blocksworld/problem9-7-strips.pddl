( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b753 - block
    b829 - block
    b607 - block
    b259 - block
    b654 - block
    b846 - block
    b923 - block
    b801 - block
    b988 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b753 )
    ( on b829 b753 )
    ( on b607 b829 )
    ( on b259 b607 )
    ( on b654 b259 )
    ( on b846 b654 )
    ( on b923 b846 )
    ( on b801 b923 )
    ( on b988 b801 )
    ( on b367 b988 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b753 )
    )
  )
)
