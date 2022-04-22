( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b276 - block
    b876 - block
    b218 - block
    b431 - block
    b344 - block
    b668 - block
    b32 - block
    b427 - block
    b211 - block
    b781 - block
    b907 - block
    b979 - block
    b55 - block
    b1 - block
    b44 - block
    b749 - block
    b808 - block
    b550 - block
    b332 - block
    b99 - block
    b286 - block
    b933 - block
    b361 - block
    b321 - block
    b264 - block
    b694 - block
    b898 - block
    b464 - block
    b396 - block
    b593 - block
    b371 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b276 )
    ( on b876 b276 )
    ( on b218 b876 )
    ( on b431 b218 )
    ( on b344 b431 )
    ( on b668 b344 )
    ( on b32 b668 )
    ( on b427 b32 )
    ( on b211 b427 )
    ( on b781 b211 )
    ( on b907 b781 )
    ( on b979 b907 )
    ( on b55 b979 )
    ( on b1 b55 )
    ( on b44 b1 )
    ( on b749 b44 )
    ( on b808 b749 )
    ( on b550 b808 )
    ( on b332 b550 )
    ( on b99 b332 )
    ( on b286 b99 )
    ( on b933 b286 )
    ( on b361 b933 )
    ( on b321 b361 )
    ( on b264 b321 )
    ( on b694 b264 )
    ( on b898 b694 )
    ( on b464 b898 )
    ( on b396 b464 )
    ( on b593 b396 )
    ( on b371 b593 )
    ( clear b371 )
  )
  ( :goal
    ( and
      ( clear b276 )
    )
  )
)
