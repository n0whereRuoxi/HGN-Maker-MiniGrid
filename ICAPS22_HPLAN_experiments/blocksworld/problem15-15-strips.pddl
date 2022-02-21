( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b147 - block
    b568 - block
    b537 - block
    b608 - block
    b637 - block
    b503 - block
    b827 - block
    b726 - block
    b323 - block
    b515 - block
    b190 - block
    b694 - block
    b819 - block
    b590 - block
    b92 - block
    b262 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b147 )
    ( on b568 b147 )
    ( on b537 b568 )
    ( on b608 b537 )
    ( on b637 b608 )
    ( on b503 b637 )
    ( on b827 b503 )
    ( on b726 b827 )
    ( on b323 b726 )
    ( on b515 b323 )
    ( on b190 b515 )
    ( on b694 b190 )
    ( on b819 b694 )
    ( on b590 b819 )
    ( on b92 b590 )
    ( on b262 b92 )
    ( clear b262 )
  )
  ( :goal
    ( and
      ( clear b147 )
    )
  )
)
