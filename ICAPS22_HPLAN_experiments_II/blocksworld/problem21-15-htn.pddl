( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b237 - block
    b838 - block
    b931 - block
    b212 - block
    b411 - block
    b685 - block
    b975 - block
    b85 - block
    b320 - block
    b328 - block
    b351 - block
    b630 - block
    b686 - block
    b44 - block
    b992 - block
    b773 - block
    b10 - block
    b21 - block
    b950 - block
    b205 - block
    b183 - block
    b184 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b237 )
    ( on b838 b237 )
    ( on b931 b838 )
    ( on b212 b931 )
    ( on b411 b212 )
    ( on b685 b411 )
    ( on b975 b685 )
    ( on b85 b975 )
    ( on b320 b85 )
    ( on b328 b320 )
    ( on b351 b328 )
    ( on b630 b351 )
    ( on b686 b630 )
    ( on b44 b686 )
    ( on b992 b44 )
    ( on b773 b992 )
    ( on b10 b773 )
    ( on b21 b10 )
    ( on b950 b21 )
    ( on b205 b950 )
    ( on b183 b205 )
    ( on b184 b183 )
    ( clear b184 )
  )
  ( :tasks
    ( Make-21Pile b838 b931 b212 b411 b685 b975 b85 b320 b328 b351 b630 b686 b44 b992 b773 b10 b21 b950 b205 b183 b184 )
  )
)
