( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b199 - block
    b24 - block
    b706 - block
    b775 - block
    b631 - block
    b84 - block
    b814 - block
    b850 - block
    b608 - block
    b552 - block
    b285 - block
    b908 - block
    b197 - block
    b31 - block
    b677 - block
    b700 - block
    b979 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b24 b199 )
    ( on b706 b24 )
    ( on b775 b706 )
    ( on b631 b775 )
    ( on b84 b631 )
    ( on b814 b84 )
    ( on b850 b814 )
    ( on b608 b850 )
    ( on b552 b608 )
    ( on b285 b552 )
    ( on b908 b285 )
    ( on b197 b908 )
    ( on b31 b197 )
    ( on b677 b31 )
    ( on b700 b677 )
    ( on b979 b700 )
    ( clear b979 )
  )
  ( :goal
    ( and
      ( clear b199 )
    )
  )
)
