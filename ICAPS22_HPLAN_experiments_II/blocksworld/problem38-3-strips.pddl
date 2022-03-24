( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b127 - block
    b213 - block
    b270 - block
    b661 - block
    b107 - block
    b150 - block
    b681 - block
    b724 - block
    b311 - block
    b876 - block
    b173 - block
    b241 - block
    b374 - block
    b470 - block
    b162 - block
    b65 - block
    b937 - block
    b841 - block
    b138 - block
    b608 - block
    b86 - block
    b612 - block
    b866 - block
    b763 - block
    b922 - block
    b267 - block
    b175 - block
    b691 - block
    b815 - block
    b367 - block
    b5 - block
    b454 - block
    b886 - block
    b971 - block
    b383 - block
    b848 - block
    b582 - block
    b565 - block
    b853 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b127 )
    ( on b213 b127 )
    ( on b270 b213 )
    ( on b661 b270 )
    ( on b107 b661 )
    ( on b150 b107 )
    ( on b681 b150 )
    ( on b724 b681 )
    ( on b311 b724 )
    ( on b876 b311 )
    ( on b173 b876 )
    ( on b241 b173 )
    ( on b374 b241 )
    ( on b470 b374 )
    ( on b162 b470 )
    ( on b65 b162 )
    ( on b937 b65 )
    ( on b841 b937 )
    ( on b138 b841 )
    ( on b608 b138 )
    ( on b86 b608 )
    ( on b612 b86 )
    ( on b866 b612 )
    ( on b763 b866 )
    ( on b922 b763 )
    ( on b267 b922 )
    ( on b175 b267 )
    ( on b691 b175 )
    ( on b815 b691 )
    ( on b367 b815 )
    ( on b5 b367 )
    ( on b454 b5 )
    ( on b886 b454 )
    ( on b971 b886 )
    ( on b383 b971 )
    ( on b848 b383 )
    ( on b582 b848 )
    ( on b565 b582 )
    ( on b853 b565 )
    ( clear b853 )
  )
  ( :goal
    ( and
      ( clear b127 )
    )
  )
)
