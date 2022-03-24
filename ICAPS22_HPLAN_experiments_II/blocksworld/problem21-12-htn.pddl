( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b539 - block
    b860 - block
    b547 - block
    b67 - block
    b734 - block
    b500 - block
    b164 - block
    b389 - block
    b593 - block
    b215 - block
    b687 - block
    b292 - block
    b397 - block
    b46 - block
    b266 - block
    b871 - block
    b33 - block
    b487 - block
    b997 - block
    b371 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b539 b466 )
    ( on b860 b539 )
    ( on b547 b860 )
    ( on b67 b547 )
    ( on b734 b67 )
    ( on b500 b734 )
    ( on b164 b500 )
    ( on b389 b164 )
    ( on b593 b389 )
    ( on b215 b593 )
    ( on b687 b215 )
    ( on b292 b687 )
    ( on b397 b292 )
    ( on b46 b397 )
    ( on b266 b46 )
    ( on b871 b266 )
    ( on b33 b871 )
    ( on b487 b33 )
    ( on b997 b487 )
    ( on b371 b997 )
    ( on b440 b371 )
    ( clear b440 )
  )
  ( :tasks
    ( Make-21Pile b539 b860 b547 b67 b734 b500 b164 b389 b593 b215 b687 b292 b397 b46 b266 b871 b33 b487 b997 b371 b440 )
  )
)
