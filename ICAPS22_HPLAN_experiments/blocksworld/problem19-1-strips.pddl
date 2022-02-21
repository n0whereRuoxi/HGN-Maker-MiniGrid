( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b671 - block
    b946 - block
    b198 - block
    b40 - block
    b72 - block
    b940 - block
    b957 - block
    b679 - block
    b322 - block
    b654 - block
    b642 - block
    b285 - block
    b429 - block
    b573 - block
    b631 - block
    b353 - block
    b186 - block
    b177 - block
    b69 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b671 )
    ( on b946 b671 )
    ( on b198 b946 )
    ( on b40 b198 )
    ( on b72 b40 )
    ( on b940 b72 )
    ( on b957 b940 )
    ( on b679 b957 )
    ( on b322 b679 )
    ( on b654 b322 )
    ( on b642 b654 )
    ( on b285 b642 )
    ( on b429 b285 )
    ( on b573 b429 )
    ( on b631 b573 )
    ( on b353 b631 )
    ( on b186 b353 )
    ( on b177 b186 )
    ( on b69 b177 )
    ( on b279 b69 )
    ( clear b279 )
  )
  ( :goal
    ( and
      ( clear b671 )
    )
  )
)
