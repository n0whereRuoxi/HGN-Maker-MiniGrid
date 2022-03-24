( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b638 - block
    b368 - block
    b322 - block
    b236 - block
    b37 - block
    b747 - block
    b708 - block
    b584 - block
    b41 - block
    b533 - block
    b645 - block
    b270 - block
    b118 - block
    b280 - block
    b882 - block
    b797 - block
    b611 - block
    b564 - block
    b279 - block
    b133 - block
    b99 - block
    b208 - block
    b362 - block
    b483 - block
    b669 - block
    b993 - block
    b205 - block
    b622 - block
    b27 - block
    b823 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b638 )
    ( on b368 b638 )
    ( on b322 b368 )
    ( on b236 b322 )
    ( on b37 b236 )
    ( on b747 b37 )
    ( on b708 b747 )
    ( on b584 b708 )
    ( on b41 b584 )
    ( on b533 b41 )
    ( on b645 b533 )
    ( on b270 b645 )
    ( on b118 b270 )
    ( on b280 b118 )
    ( on b882 b280 )
    ( on b797 b882 )
    ( on b611 b797 )
    ( on b564 b611 )
    ( on b279 b564 )
    ( on b133 b279 )
    ( on b99 b133 )
    ( on b208 b99 )
    ( on b362 b208 )
    ( on b483 b362 )
    ( on b669 b483 )
    ( on b993 b669 )
    ( on b205 b993 )
    ( on b622 b205 )
    ( on b27 b622 )
    ( on b823 b27 )
    ( clear b823 )
  )
  ( :tasks
    ( Make-29Pile b368 b322 b236 b37 b747 b708 b584 b41 b533 b645 b270 b118 b280 b882 b797 b611 b564 b279 b133 b99 b208 b362 b483 b669 b993 b205 b622 b27 b823 )
  )
)
