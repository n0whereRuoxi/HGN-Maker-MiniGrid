( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b190 - block
    b916 - block
    b92 - block
    b116 - block
    b821 - block
    b80 - block
    b532 - block
    b104 - block
    b158 - block
    b385 - block
    b355 - block
    b392 - block
    b640 - block
    b395 - block
    b963 - block
    b157 - block
    b879 - block
    b649 - block
    b440 - block
    b416 - block
    b165 - block
    b927 - block
    b725 - block
    b502 - block
    b666 - block
    b160 - block
    b326 - block
    b211 - block
    b368 - block
    b258 - block
    b264 - block
    b881 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b190 )
    ( on b916 b190 )
    ( on b92 b916 )
    ( on b116 b92 )
    ( on b821 b116 )
    ( on b80 b821 )
    ( on b532 b80 )
    ( on b104 b532 )
    ( on b158 b104 )
    ( on b385 b158 )
    ( on b355 b385 )
    ( on b392 b355 )
    ( on b640 b392 )
    ( on b395 b640 )
    ( on b963 b395 )
    ( on b157 b963 )
    ( on b879 b157 )
    ( on b649 b879 )
    ( on b440 b649 )
    ( on b416 b440 )
    ( on b165 b416 )
    ( on b927 b165 )
    ( on b725 b927 )
    ( on b502 b725 )
    ( on b666 b502 )
    ( on b160 b666 )
    ( on b326 b160 )
    ( on b211 b326 )
    ( on b368 b211 )
    ( on b258 b368 )
    ( on b264 b258 )
    ( on b881 b264 )
    ( clear b881 )
  )
  ( :goal
    ( and
      ( clear b190 )
    )
  )
)
