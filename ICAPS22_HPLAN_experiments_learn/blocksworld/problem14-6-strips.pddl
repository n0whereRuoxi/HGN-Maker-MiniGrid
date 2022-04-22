( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b661 - block
    b717 - block
    b859 - block
    b125 - block
    b976 - block
    b979 - block
    b679 - block
    b558 - block
    b19 - block
    b277 - block
    b499 - block
    b883 - block
    b927 - block
    b384 - block
    b835 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b661 )
    ( on b717 b661 )
    ( on b859 b717 )
    ( on b125 b859 )
    ( on b976 b125 )
    ( on b979 b976 )
    ( on b679 b979 )
    ( on b558 b679 )
    ( on b19 b558 )
    ( on b277 b19 )
    ( on b499 b277 )
    ( on b883 b499 )
    ( on b927 b883 )
    ( on b384 b927 )
    ( on b835 b384 )
    ( clear b835 )
  )
  ( :goal
    ( and
      ( clear b661 )
    )
  )
)
