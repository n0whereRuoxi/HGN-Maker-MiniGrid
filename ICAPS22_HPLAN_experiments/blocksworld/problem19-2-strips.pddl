( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b635 - block
    b163 - block
    b396 - block
    b304 - block
    b128 - block
    b801 - block
    b859 - block
    b186 - block
    b614 - block
    b124 - block
    b372 - block
    b297 - block
    b252 - block
    b291 - block
    b914 - block
    b449 - block
    b374 - block
    b479 - block
    b684 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b635 b845 )
    ( on b163 b635 )
    ( on b396 b163 )
    ( on b304 b396 )
    ( on b128 b304 )
    ( on b801 b128 )
    ( on b859 b801 )
    ( on b186 b859 )
    ( on b614 b186 )
    ( on b124 b614 )
    ( on b372 b124 )
    ( on b297 b372 )
    ( on b252 b297 )
    ( on b291 b252 )
    ( on b914 b291 )
    ( on b449 b914 )
    ( on b374 b449 )
    ( on b479 b374 )
    ( on b684 b479 )
    ( clear b684 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)
