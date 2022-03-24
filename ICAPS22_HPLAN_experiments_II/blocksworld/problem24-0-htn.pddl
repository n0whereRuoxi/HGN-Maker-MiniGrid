( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b246 - block
    b828 - block
    b552 - block
    b330 - block
    b840 - block
    b316 - block
    b910 - block
    b96 - block
    b525 - block
    b629 - block
    b744 - block
    b793 - block
    b713 - block
    b996 - block
    b783 - block
    b75 - block
    b177 - block
    b10 - block
    b557 - block
    b826 - block
    b618 - block
    b949 - block
    b575 - block
    b822 - block
    b911 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b246 )
    ( on b828 b246 )
    ( on b552 b828 )
    ( on b330 b552 )
    ( on b840 b330 )
    ( on b316 b840 )
    ( on b910 b316 )
    ( on b96 b910 )
    ( on b525 b96 )
    ( on b629 b525 )
    ( on b744 b629 )
    ( on b793 b744 )
    ( on b713 b793 )
    ( on b996 b713 )
    ( on b783 b996 )
    ( on b75 b783 )
    ( on b177 b75 )
    ( on b10 b177 )
    ( on b557 b10 )
    ( on b826 b557 )
    ( on b618 b826 )
    ( on b949 b618 )
    ( on b575 b949 )
    ( on b822 b575 )
    ( on b911 b822 )
    ( clear b911 )
  )
  ( :tasks
    ( Make-24Pile b828 b552 b330 b840 b316 b910 b96 b525 b629 b744 b793 b713 b996 b783 b75 b177 b10 b557 b826 b618 b949 b575 b822 b911 )
  )
)
