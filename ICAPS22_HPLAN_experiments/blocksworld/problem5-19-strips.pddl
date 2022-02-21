( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b608 - block
    b591 - block
    b406 - block
    b779 - block
    b154 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b608 b107 )
    ( on b591 b608 )
    ( on b406 b591 )
    ( on b779 b406 )
    ( on b154 b779 )
    ( clear b154 )
  )
  ( :goal
    ( and
      ( clear b107 )
      ( clear b107 )
      ( clear b107 )
      ( clear b107 )
      ( clear b107 )
      ( clear b107 )
    )
  )
)
