( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b380 - block
    b251 - block
    b843 - block
    b589 - block
    b347 - block
    b102 - block
    b978 - block
    b926 - block
    b644 - block
    b478 - block
    b614 - block
    b402 - block
    b989 - block
    b679 - block
    b204 - block
    b303 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b380 )
    ( on b251 b380 )
    ( on b843 b251 )
    ( on b589 b843 )
    ( on b347 b589 )
    ( on b102 b347 )
    ( on b978 b102 )
    ( on b926 b978 )
    ( on b644 b926 )
    ( on b478 b644 )
    ( on b614 b478 )
    ( on b402 b614 )
    ( on b989 b402 )
    ( on b679 b989 )
    ( on b204 b679 )
    ( on b303 b204 )
    ( clear b303 )
  )
  ( :goal
    ( and
      ( clear b380 )
    )
  )
)
