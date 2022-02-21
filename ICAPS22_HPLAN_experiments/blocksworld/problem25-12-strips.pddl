( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b897 - block
    b67 - block
    b630 - block
    b336 - block
    b928 - block
    b969 - block
    b170 - block
    b40 - block
    b591 - block
    b277 - block
    b705 - block
    b204 - block
    b399 - block
    b12 - block
    b911 - block
    b205 - block
    b83 - block
    b98 - block
    b650 - block
    b634 - block
    b627 - block
    b713 - block
    b685 - block
    b865 - block
    b348 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b897 )
    ( on b67 b897 )
    ( on b630 b67 )
    ( on b336 b630 )
    ( on b928 b336 )
    ( on b969 b928 )
    ( on b170 b969 )
    ( on b40 b170 )
    ( on b591 b40 )
    ( on b277 b591 )
    ( on b705 b277 )
    ( on b204 b705 )
    ( on b399 b204 )
    ( on b12 b399 )
    ( on b911 b12 )
    ( on b205 b911 )
    ( on b83 b205 )
    ( on b98 b83 )
    ( on b650 b98 )
    ( on b634 b650 )
    ( on b627 b634 )
    ( on b713 b627 )
    ( on b685 b713 )
    ( on b865 b685 )
    ( on b348 b865 )
    ( on b916 b348 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b897 )
    )
  )
)
