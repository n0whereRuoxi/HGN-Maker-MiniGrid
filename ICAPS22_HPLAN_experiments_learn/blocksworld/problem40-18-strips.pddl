( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b655 - block
    b225 - block
    b440 - block
    b663 - block
    b182 - block
    b132 - block
    b177 - block
    b938 - block
    b252 - block
    b178 - block
    b971 - block
    b365 - block
    b368 - block
    b726 - block
    b59 - block
    b318 - block
    b906 - block
    b570 - block
    b249 - block
    b4 - block
    b581 - block
    b424 - block
    b276 - block
    b802 - block
    b974 - block
    b922 - block
    b524 - block
    b538 - block
    b969 - block
    b898 - block
    b218 - block
    b219 - block
    b2 - block
    b778 - block
    b667 - block
    b793 - block
    b376 - block
    b330 - block
    b413 - block
    b313 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b655 )
    ( on b225 b655 )
    ( on b440 b225 )
    ( on b663 b440 )
    ( on b182 b663 )
    ( on b132 b182 )
    ( on b177 b132 )
    ( on b938 b177 )
    ( on b252 b938 )
    ( on b178 b252 )
    ( on b971 b178 )
    ( on b365 b971 )
    ( on b368 b365 )
    ( on b726 b368 )
    ( on b59 b726 )
    ( on b318 b59 )
    ( on b906 b318 )
    ( on b570 b906 )
    ( on b249 b570 )
    ( on b4 b249 )
    ( on b581 b4 )
    ( on b424 b581 )
    ( on b276 b424 )
    ( on b802 b276 )
    ( on b974 b802 )
    ( on b922 b974 )
    ( on b524 b922 )
    ( on b538 b524 )
    ( on b969 b538 )
    ( on b898 b969 )
    ( on b218 b898 )
    ( on b219 b218 )
    ( on b2 b219 )
    ( on b778 b2 )
    ( on b667 b778 )
    ( on b793 b667 )
    ( on b376 b793 )
    ( on b330 b376 )
    ( on b413 b330 )
    ( on b313 b413 )
    ( on b175 b313 )
    ( clear b175 )
  )
  ( :goal
    ( and
      ( clear b655 )
    )
  )
)
