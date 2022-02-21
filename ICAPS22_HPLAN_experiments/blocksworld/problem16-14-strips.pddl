( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b792 - block
    b103 - block
    b482 - block
    b16 - block
    b675 - block
    b81 - block
    b175 - block
    b974 - block
    b485 - block
    b321 - block
    b657 - block
    b364 - block
    b690 - block
    b513 - block
    b800 - block
    b458 - block
    b783 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b792 )
    ( on b103 b792 )
    ( on b482 b103 )
    ( on b16 b482 )
    ( on b675 b16 )
    ( on b81 b675 )
    ( on b175 b81 )
    ( on b974 b175 )
    ( on b485 b974 )
    ( on b321 b485 )
    ( on b657 b321 )
    ( on b364 b657 )
    ( on b690 b364 )
    ( on b513 b690 )
    ( on b800 b513 )
    ( on b458 b800 )
    ( on b783 b458 )
    ( clear b783 )
  )
  ( :goal
    ( and
      ( clear b792 )
    )
  )
)
