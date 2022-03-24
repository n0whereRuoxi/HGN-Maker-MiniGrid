( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b119 - block
    b732 - block
    b276 - block
    b737 - block
    b923 - block
    b222 - block
    b626 - block
    b469 - block
    b682 - block
    b601 - block
    b726 - block
    b674 - block
    b740 - block
    b313 - block
    b301 - block
    b262 - block
    b862 - block
    b456 - block
    b351 - block
    b226 - block
    b947 - block
    b568 - block
    b638 - block
    b913 - block
    b556 - block
    b535 - block
    b971 - block
    b613 - block
    b926 - block
    b879 - block
    b681 - block
    b242 - block
    b585 - block
    b566 - block
    b956 - block
    b58 - block
    b640 - block
    b673 - block
    b360 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b119 )
    ( on b732 b119 )
    ( on b276 b732 )
    ( on b737 b276 )
    ( on b923 b737 )
    ( on b222 b923 )
    ( on b626 b222 )
    ( on b469 b626 )
    ( on b682 b469 )
    ( on b601 b682 )
    ( on b726 b601 )
    ( on b674 b726 )
    ( on b740 b674 )
    ( on b313 b740 )
    ( on b301 b313 )
    ( on b262 b301 )
    ( on b862 b262 )
    ( on b456 b862 )
    ( on b351 b456 )
    ( on b226 b351 )
    ( on b947 b226 )
    ( on b568 b947 )
    ( on b638 b568 )
    ( on b913 b638 )
    ( on b556 b913 )
    ( on b535 b556 )
    ( on b971 b535 )
    ( on b613 b971 )
    ( on b926 b613 )
    ( on b879 b926 )
    ( on b681 b879 )
    ( on b242 b681 )
    ( on b585 b242 )
    ( on b566 b585 )
    ( on b956 b566 )
    ( on b58 b956 )
    ( on b640 b58 )
    ( on b673 b640 )
    ( on b360 b673 )
    ( clear b360 )
  )
  ( :tasks
    ( Make-38Pile b732 b276 b737 b923 b222 b626 b469 b682 b601 b726 b674 b740 b313 b301 b262 b862 b456 b351 b226 b947 b568 b638 b913 b556 b535 b971 b613 b926 b879 b681 b242 b585 b566 b956 b58 b640 b673 b360 )
  )
)
