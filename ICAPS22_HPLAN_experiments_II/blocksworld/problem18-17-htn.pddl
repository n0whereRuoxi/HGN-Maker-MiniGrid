( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b651 - block
    b128 - block
    b589 - block
    b447 - block
    b276 - block
    b347 - block
    b113 - block
    b877 - block
    b117 - block
    b744 - block
    b816 - block
    b993 - block
    b990 - block
    b250 - block
    b674 - block
    b351 - block
    b289 - block
    b880 - block
    b395 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b651 )
    ( on b128 b651 )
    ( on b589 b128 )
    ( on b447 b589 )
    ( on b276 b447 )
    ( on b347 b276 )
    ( on b113 b347 )
    ( on b877 b113 )
    ( on b117 b877 )
    ( on b744 b117 )
    ( on b816 b744 )
    ( on b993 b816 )
    ( on b990 b993 )
    ( on b250 b990 )
    ( on b674 b250 )
    ( on b351 b674 )
    ( on b289 b351 )
    ( on b880 b289 )
    ( on b395 b880 )
    ( clear b395 )
  )
  ( :tasks
    ( Make-18Pile b128 b589 b447 b276 b347 b113 b877 b117 b744 b816 b993 b990 b250 b674 b351 b289 b880 b395 )
  )
)
