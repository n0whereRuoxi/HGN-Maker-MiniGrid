( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b151 - block
    b456 - block
    b891 - block
    b969 - block
    b386 - block
    b942 - block
    b368 - block
    b336 - block
    b117 - block
    b40 - block
    b913 - block
    b668 - block
    b830 - block
    b282 - block
    b511 - block
    b712 - block
    b827 - block
    b683 - block
    b342 - block
    b360 - block
    b958 - block
    b279 - block
    b378 - block
    b858 - block
    b304 - block
    b752 - block
    b945 - block
    b266 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b151 b59 )
    ( on b456 b151 )
    ( on b891 b456 )
    ( on b969 b891 )
    ( on b386 b969 )
    ( on b942 b386 )
    ( on b368 b942 )
    ( on b336 b368 )
    ( on b117 b336 )
    ( on b40 b117 )
    ( on b913 b40 )
    ( on b668 b913 )
    ( on b830 b668 )
    ( on b282 b830 )
    ( on b511 b282 )
    ( on b712 b511 )
    ( on b827 b712 )
    ( on b683 b827 )
    ( on b342 b683 )
    ( on b360 b342 )
    ( on b958 b360 )
    ( on b279 b958 )
    ( on b378 b279 )
    ( on b858 b378 )
    ( on b304 b858 )
    ( on b752 b304 )
    ( on b945 b752 )
    ( on b266 b945 )
    ( on b543 b266 )
    ( clear b543 )
  )
  ( :tasks
    ( Make-29Pile b151 b456 b891 b969 b386 b942 b368 b336 b117 b40 b913 b668 b830 b282 b511 b712 b827 b683 b342 b360 b958 b279 b378 b858 b304 b752 b945 b266 b543 )
  )
)
