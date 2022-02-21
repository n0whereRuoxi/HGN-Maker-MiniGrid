( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b367 - block
    b621 - block
    b148 - block
    b865 - block
    b249 - block
    b468 - block
    b554 - block
    b860 - block
    b296 - block
    b573 - block
    b375 - block
    b333 - block
    b766 - block
    b140 - block
    b229 - block
    b99 - block
    b332 - block
    b608 - block
    b694 - block
    b771 - block
    b214 - block
    b716 - block
    b541 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b367 )
    ( on b621 b367 )
    ( on b148 b621 )
    ( on b865 b148 )
    ( on b249 b865 )
    ( on b468 b249 )
    ( on b554 b468 )
    ( on b860 b554 )
    ( on b296 b860 )
    ( on b573 b296 )
    ( on b375 b573 )
    ( on b333 b375 )
    ( on b766 b333 )
    ( on b140 b766 )
    ( on b229 b140 )
    ( on b99 b229 )
    ( on b332 b99 )
    ( on b608 b332 )
    ( on b694 b608 )
    ( on b771 b694 )
    ( on b214 b771 )
    ( on b716 b214 )
    ( on b541 b716 )
    ( on b341 b541 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b367 )
    )
  )
)
