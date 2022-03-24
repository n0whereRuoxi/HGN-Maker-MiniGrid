( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b471 - block
    b798 - block
    b773 - block
    b874 - block
    b87 - block
    b441 - block
    b245 - block
    b603 - block
    b261 - block
    b759 - block
    b75 - block
    b633 - block
    b925 - block
    b594 - block
    b546 - block
    b359 - block
    b483 - block
    b105 - block
    b32 - block
    b567 - block
    b833 - block
    b699 - block
    b10 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b471 )
    ( on b798 b471 )
    ( on b773 b798 )
    ( on b874 b773 )
    ( on b87 b874 )
    ( on b441 b87 )
    ( on b245 b441 )
    ( on b603 b245 )
    ( on b261 b603 )
    ( on b759 b261 )
    ( on b75 b759 )
    ( on b633 b75 )
    ( on b925 b633 )
    ( on b594 b925 )
    ( on b546 b594 )
    ( on b359 b546 )
    ( on b483 b359 )
    ( on b105 b483 )
    ( on b32 b105 )
    ( on b567 b32 )
    ( on b833 b567 )
    ( on b699 b833 )
    ( on b10 b699 )
    ( on b421 b10 )
    ( clear b421 )
  )
  ( :tasks
    ( Make-23Pile b798 b773 b874 b87 b441 b245 b603 b261 b759 b75 b633 b925 b594 b546 b359 b483 b105 b32 b567 b833 b699 b10 b421 )
  )
)
