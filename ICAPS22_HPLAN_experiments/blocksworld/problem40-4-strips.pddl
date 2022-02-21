( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b380 - block
    b281 - block
    b783 - block
    b121 - block
    b937 - block
    b590 - block
    b471 - block
    b149 - block
    b706 - block
    b785 - block
    b586 - block
    b898 - block
    b555 - block
    b408 - block
    b186 - block
    b826 - block
    b963 - block
    b480 - block
    b696 - block
    b82 - block
    b212 - block
    b322 - block
    b596 - block
    b985 - block
    b502 - block
    b685 - block
    b744 - block
    b478 - block
    b191 - block
    b94 - block
    b241 - block
    b890 - block
    b738 - block
    b40 - block
    b724 - block
    b918 - block
    b913 - block
    b583 - block
    b462 - block
    b557 - block
    b134 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b380 )
    ( on b281 b380 )
    ( on b783 b281 )
    ( on b121 b783 )
    ( on b937 b121 )
    ( on b590 b937 )
    ( on b471 b590 )
    ( on b149 b471 )
    ( on b706 b149 )
    ( on b785 b706 )
    ( on b586 b785 )
    ( on b898 b586 )
    ( on b555 b898 )
    ( on b408 b555 )
    ( on b186 b408 )
    ( on b826 b186 )
    ( on b963 b826 )
    ( on b480 b963 )
    ( on b696 b480 )
    ( on b82 b696 )
    ( on b212 b82 )
    ( on b322 b212 )
    ( on b596 b322 )
    ( on b985 b596 )
    ( on b502 b985 )
    ( on b685 b502 )
    ( on b744 b685 )
    ( on b478 b744 )
    ( on b191 b478 )
    ( on b94 b191 )
    ( on b241 b94 )
    ( on b890 b241 )
    ( on b738 b890 )
    ( on b40 b738 )
    ( on b724 b40 )
    ( on b918 b724 )
    ( on b913 b918 )
    ( on b583 b913 )
    ( on b462 b583 )
    ( on b557 b462 )
    ( on b134 b557 )
    ( clear b134 )
  )
  ( :goal
    ( and
      ( clear b380 )
    )
  )
)
