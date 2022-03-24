( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b391 - block
    b832 - block
    b625 - block
    b77 - block
    b938 - block
    b329 - block
    b559 - block
    b547 - block
    b935 - block
    b440 - block
    b119 - block
    b34 - block
    b912 - block
    b786 - block
    b57 - block
    b459 - block
    b447 - block
    b24 - block
    b848 - block
    b977 - block
    b854 - block
    b441 - block
    b67 - block
    b360 - block
    b652 - block
    b454 - block
    b532 - block
    b728 - block
    b923 - block
    b44 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b391 )
    ( on b832 b391 )
    ( on b625 b832 )
    ( on b77 b625 )
    ( on b938 b77 )
    ( on b329 b938 )
    ( on b559 b329 )
    ( on b547 b559 )
    ( on b935 b547 )
    ( on b440 b935 )
    ( on b119 b440 )
    ( on b34 b119 )
    ( on b912 b34 )
    ( on b786 b912 )
    ( on b57 b786 )
    ( on b459 b57 )
    ( on b447 b459 )
    ( on b24 b447 )
    ( on b848 b24 )
    ( on b977 b848 )
    ( on b854 b977 )
    ( on b441 b854 )
    ( on b67 b441 )
    ( on b360 b67 )
    ( on b652 b360 )
    ( on b454 b652 )
    ( on b532 b454 )
    ( on b728 b532 )
    ( on b923 b728 )
    ( on b44 b923 )
    ( clear b44 )
  )
  ( :tasks
    ( Make-29Pile b832 b625 b77 b938 b329 b559 b547 b935 b440 b119 b34 b912 b786 b57 b459 b447 b24 b848 b977 b854 b441 b67 b360 b652 b454 b532 b728 b923 b44 )
  )
)
