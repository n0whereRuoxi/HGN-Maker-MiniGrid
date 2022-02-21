( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b380 - block
    b939 - block
    b285 - block
    b607 - block
    b504 - block
    b823 - block
    b51 - block
    b154 - block
    b268 - block
    b350 - block
    b101 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b380 b845 )
    ( on b939 b380 )
    ( on b285 b939 )
    ( on b607 b285 )
    ( on b504 b607 )
    ( on b823 b504 )
    ( on b51 b823 )
    ( on b154 b51 )
    ( on b268 b154 )
    ( on b350 b268 )
    ( on b101 b350 )
    ( clear b101 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)
