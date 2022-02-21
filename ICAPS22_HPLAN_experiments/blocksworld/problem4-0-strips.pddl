( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b87 - block
    b255 - block
    b826 - block
    b91 - block
    b577 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b87 )
    ( on b255 b87 )
    ( on b826 b255 )
    ( on b91 b826 )
    ( on b577 b91 )
    ( clear b577 )
  )
  ( :goal
    ( and
      ( clear b87 )
      ( clear b87 )
      ( clear b87 )
      ( clear b87 )
      ( clear b87 )
    )
  )
)
