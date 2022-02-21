( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b944 - block
    b690 - block
    b664 - block
    b771 - block
    b926 - block
    b310 - block
    b23 - block
    b943 - block
    b550 - block
    b47 - block
    b363 - block
    b819 - block
    b731 - block
    b329 - block
    b337 - block
    b484 - block
    b455 - block
    b129 - block
    b763 - block
    b68 - block
    b8 - block
    b376 - block
    b678 - block
    b703 - block
    b464 - block
    b103 - block
    b681 - block
    b359 - block
    b154 - block
    b684 - block
    b21 - block
    b844 - block
    b175 - block
    b989 - block
    b259 - block
    b44 - block
    b104 - block
    b91 - block
    b869 - block
    b959 - block
    b520 - block
    b281 - block
    b986 - block
    b885 - block
    b677 - block
    b327 - block
    b728 - block
    b507 - block
    b565 - block
    b813 - block
    b796 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b944 )
    ( on b690 b944 )
    ( on b664 b690 )
    ( on b771 b664 )
    ( on b926 b771 )
    ( on b310 b926 )
    ( on b23 b310 )
    ( on b943 b23 )
    ( on b550 b943 )
    ( on b47 b550 )
    ( on b363 b47 )
    ( on b819 b363 )
    ( on b731 b819 )
    ( on b329 b731 )
    ( on b337 b329 )
    ( on b484 b337 )
    ( on b455 b484 )
    ( on b129 b455 )
    ( on b763 b129 )
    ( on b68 b763 )
    ( on b8 b68 )
    ( on b376 b8 )
    ( on b678 b376 )
    ( on b703 b678 )
    ( on b464 b703 )
    ( on b103 b464 )
    ( on b681 b103 )
    ( on b359 b681 )
    ( on b154 b359 )
    ( on b684 b154 )
    ( on b21 b684 )
    ( on b844 b21 )
    ( on b175 b844 )
    ( on b989 b175 )
    ( on b259 b989 )
    ( on b44 b259 )
    ( on b104 b44 )
    ( on b91 b104 )
    ( on b869 b91 )
    ( on b959 b869 )
    ( on b520 b959 )
    ( on b281 b520 )
    ( on b986 b281 )
    ( on b885 b986 )
    ( on b677 b885 )
    ( on b327 b677 )
    ( on b728 b327 )
    ( on b507 b728 )
    ( on b565 b507 )
    ( on b813 b565 )
    ( on b796 b813 )
    ( clear b796 )
  )
  ( :goal
    ( and
      ( clear b944 )
    )
  )
)
