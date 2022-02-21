( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b592 - block
    b670 - block
    b188 - block
    b821 - block
    b302 - block
    b205 - block
    b30 - block
    b346 - block
    b155 - block
    b735 - block
    b165 - block
    b932 - block
    b253 - block
    b248 - block
    b803 - block
    b406 - block
    b484 - block
    b655 - block
    b241 - block
    b194 - block
    b626 - block
    b249 - block
    b119 - block
    b934 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b592 )
    ( on b670 b592 )
    ( on b188 b670 )
    ( on b821 b188 )
    ( on b302 b821 )
    ( on b205 b302 )
    ( on b30 b205 )
    ( on b346 b30 )
    ( on b155 b346 )
    ( on b735 b155 )
    ( on b165 b735 )
    ( on b932 b165 )
    ( on b253 b932 )
    ( on b248 b253 )
    ( on b803 b248 )
    ( on b406 b803 )
    ( on b484 b406 )
    ( on b655 b484 )
    ( on b241 b655 )
    ( on b194 b241 )
    ( on b626 b194 )
    ( on b249 b626 )
    ( on b119 b249 )
    ( on b934 b119 )
    ( clear b934 )
  )
  ( :goal
    ( and
      ( clear b592 )
    )
  )
)
