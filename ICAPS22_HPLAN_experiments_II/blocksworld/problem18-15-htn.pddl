( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b15 - block
    b245 - block
    b2 - block
    b689 - block
    b319 - block
    b292 - block
    b829 - block
    b977 - block
    b373 - block
    b332 - block
    b685 - block
    b948 - block
    b413 - block
    b80 - block
    b318 - block
    b140 - block
    b186 - block
    b233 - block
    b955 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b15 )
    ( on b245 b15 )
    ( on b2 b245 )
    ( on b689 b2 )
    ( on b319 b689 )
    ( on b292 b319 )
    ( on b829 b292 )
    ( on b977 b829 )
    ( on b373 b977 )
    ( on b332 b373 )
    ( on b685 b332 )
    ( on b948 b685 )
    ( on b413 b948 )
    ( on b80 b413 )
    ( on b318 b80 )
    ( on b140 b318 )
    ( on b186 b140 )
    ( on b233 b186 )
    ( on b955 b233 )
    ( clear b955 )
  )
  ( :tasks
    ( Make-18Pile b245 b2 b689 b319 b292 b829 b977 b373 b332 b685 b948 b413 b80 b318 b140 b186 b233 b955 )
  )
)
