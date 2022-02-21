( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b181 - block
    b332 - block
    b655 - block
    b37 - block
    b69 - block
    b938 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b181 )
    ( on b332 b181 )
    ( on b655 b332 )
    ( on b37 b655 )
    ( on b69 b37 )
    ( on b938 b69 )
    ( clear b938 )
  )
  ( :goal
    ( and
      ( clear b181 )
      ( clear b181 )
      ( clear b181 )
      ( clear b181 )
      ( clear b181 )
      ( clear b181 )
    )
  )
)
