( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b584 - block
    b528 - block
    b763 - block
    b181 - block
    b573 - block
    b649 - block
    b21 - block
    b405 - block
    b453 - block
    b85 - block
    b204 - block
    b423 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b584 )
    ( on b528 b584 )
    ( on b763 b528 )
    ( on b181 b763 )
    ( on b573 b181 )
    ( on b649 b573 )
    ( on b21 b649 )
    ( on b405 b21 )
    ( on b453 b405 )
    ( on b85 b453 )
    ( on b204 b85 )
    ( on b423 b204 )
    ( on b397 b423 )
    ( clear b397 )
  )
  ( :tasks
    ( Make-12Pile b528 b763 b181 b573 b649 b21 b405 b453 b85 b204 b423 b397 )
  )
)
