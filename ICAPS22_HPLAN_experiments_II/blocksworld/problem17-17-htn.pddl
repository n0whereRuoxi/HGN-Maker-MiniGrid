( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b377 - block
    b381 - block
    b120 - block
    b612 - block
    b656 - block
    b675 - block
    b308 - block
    b944 - block
    b102 - block
    b620 - block
    b937 - block
    b684 - block
    b739 - block
    b79 - block
    b614 - block
    b725 - block
    b493 - block
    b423 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b377 )
    ( on b381 b377 )
    ( on b120 b381 )
    ( on b612 b120 )
    ( on b656 b612 )
    ( on b675 b656 )
    ( on b308 b675 )
    ( on b944 b308 )
    ( on b102 b944 )
    ( on b620 b102 )
    ( on b937 b620 )
    ( on b684 b937 )
    ( on b739 b684 )
    ( on b79 b739 )
    ( on b614 b79 )
    ( on b725 b614 )
    ( on b493 b725 )
    ( on b423 b493 )
    ( clear b423 )
  )
  ( :tasks
    ( Make-17Pile b381 b120 b612 b656 b675 b308 b944 b102 b620 b937 b684 b739 b79 b614 b725 b493 b423 )
  )
)
