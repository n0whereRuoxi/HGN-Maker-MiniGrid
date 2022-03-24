( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b884 - block
    b645 - block
    b262 - block
    b545 - block
    b141 - block
    b205 - block
    b841 - block
    b851 - block
    b974 - block
    b50 - block
    b252 - block
    b850 - block
    b124 - block
    b104 - block
    b570 - block
    b210 - block
    b840 - block
    b97 - block
    b807 - block
    b81 - block
    b461 - block
    b8 - block
    b599 - block
    b638 - block
    b815 - block
    b77 - block
    b773 - block
    b235 - block
    b475 - block
    b426 - block
    b715 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b884 )
    ( on b645 b884 )
    ( on b262 b645 )
    ( on b545 b262 )
    ( on b141 b545 )
    ( on b205 b141 )
    ( on b841 b205 )
    ( on b851 b841 )
    ( on b974 b851 )
    ( on b50 b974 )
    ( on b252 b50 )
    ( on b850 b252 )
    ( on b124 b850 )
    ( on b104 b124 )
    ( on b570 b104 )
    ( on b210 b570 )
    ( on b840 b210 )
    ( on b97 b840 )
    ( on b807 b97 )
    ( on b81 b807 )
    ( on b461 b81 )
    ( on b8 b461 )
    ( on b599 b8 )
    ( on b638 b599 )
    ( on b815 b638 )
    ( on b77 b815 )
    ( on b773 b77 )
    ( on b235 b773 )
    ( on b475 b235 )
    ( on b426 b475 )
    ( on b715 b426 )
    ( on b742 b715 )
    ( clear b742 )
  )
  ( :tasks
    ( Make-31Pile b645 b262 b545 b141 b205 b841 b851 b974 b50 b252 b850 b124 b104 b570 b210 b840 b97 b807 b81 b461 b8 b599 b638 b815 b77 b773 b235 b475 b426 b715 b742 )
  )
)
