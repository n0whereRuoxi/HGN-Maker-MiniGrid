( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b662 - block
    b886 - block
    b299 - block
    b974 - block
    b614 - block
    b361 - block
    b327 - block
    b580 - block
    b718 - block
    b362 - block
    b890 - block
    b219 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b662 )
    ( on b886 b662 )
    ( on b299 b886 )
    ( on b974 b299 )
    ( on b614 b974 )
    ( on b361 b614 )
    ( on b327 b361 )
    ( on b580 b327 )
    ( on b718 b580 )
    ( on b362 b718 )
    ( on b890 b362 )
    ( on b219 b890 )
    ( clear b219 )
  )
  ( :goal
    ( and
      ( clear b662 )
    )
  )
)
