( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b847 - block
    b107 - block
    b105 - block
    b785 - block
    b505 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b847 )
    ( on b107 b847 )
    ( on b105 b107 )
    ( on b785 b105 )
    ( on b505 b785 )
    ( clear b505 )
  )
  ( :goal
    ( and
      ( clear b847 )
      ( clear b847 )
      ( clear b847 )
      ( clear b847 )
      ( clear b847 )
    )
  )
)
