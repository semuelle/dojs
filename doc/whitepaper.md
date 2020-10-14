# DOJS – A System of Open and Decentralized Journals

[Sebastian Matthias Müller](mailto:sebastian@flexdapps.com)

Flex Dapps Pty Ltd

Melbourne, Australia

# Abstract

This whitepaper presents DOJS, a novel approach to sharing and publishing academic work. DOJS (Decentralized Open Journal System) is a digital platform combining the concepts of the Decentralized Autonomous Journal (DAJ) and the "Knowledge Club" on the bloxberg blockchain. As such, it allows likeminded peers to connect and to share and review literature in a moderated community while its core data is stored on decentralized networks and allows the users to interact with the data without having to depend on centralized infrastructure.

# Motivation

Advances in communication technology is calling the relationship between authors and publishers of academic works into question. While large publishers rely on professionals to provide editorial work and reviews through (generally) unpaid work, they generate increasing returns. In 2018, Elsevier, one of the largest scientific publishers in the world [2], drew a profit of ₤942 million. Open Access (OA) journals allow authors to publish their work freely available for the reader, but usually require the author to pay a substantial fee. Various models combining classical and OA publication have been implemented, but none has gained much traction [3].

We argue that modern academic journals must build upon two principles: first, using open data and open source, it must give its community the opportunity to build their own tools and infrastructure. Second, it must be based on the same structures as regular academic communities, in the form of semi-closed groups developing around shared knowledge and its exchange. To this end, DOJS stores large parts of the data shared by its members on decentralized networks. That way, data can be shared with others and will still be available even when any centralized architecture fails. This aspect is particularly useful for those who wish to make contributions of unpaid editors and reviewers more visible. Contributions, however, are still governed through access control on smart contracts and storage of private or personal information on centralized, secured servers. By focusing on building the core infrastructure and making it maximally accessible, we hope to build a community that feels encouraged and able to build upon it and make further use of the data provided.

# Implementation

![](overview.png)

The core functionality of DOJS is implemented as a smart contract stored on bloxberg3. Bloxberg [8] is a public, Ethereum-based proof-of-authority blockchain, spearheaded by the Max Planck Digital Library and maintained by 29 validators, which are members of the consortium and mostly public research institutions. Bloxberg was chosen as the smart contract platform for two reasons: first, as a science-oriented project and its pool of validators made up of research institutions, bloxberg welcomes developers and researchers alike to evaluate and establish new research and publishing infrastructure. Second, the native currency of bloxberg, “bergs”, which is required to pay for transactions on the blockchain, can be obtained free of charge through a public faucet. While this makes bloxberg susceptible to spam attacks, it also makes high transaction volume dapps (decentralized applications) viable.

The smart contracts hold only basic information, such as the blockchain address of the author of an article and the IPFS address of files stored on IPFS. If a review or the full-text of an article cannot or should not be public, the submitting author may choose to encrypt the file before it is uploaded to IPFS. In that case, the item cannot be accessed without the centralized DOJS infrastructure as the encryption key will be stored there. The bulk of the data is stored on IPFS in JSON format, following the CrossRef [9] standard.

Since onboarding of new users to a blockchain usually involves several steps, such as setting up a wallet, an account and transferring native currency to pay for transactions, we have implemented meta transactions with the help of the Gas Station Network4. That way, any user who is not interested in taking control of their data may join the journal, and the DOJS backend acts as a custodial wallet, generates an public-private keypair for the user and executes the on-chain transactions on behalf of the user.

Frontend and backend that enable the interaction between users, DOJS, bloxberg and IPFS are implemented using JavaScript and SQL.

# Outlook

During function execution, the DOJS smart contracts emit events that any network participant can listen and react to. That enables third parties to react to smart contract interactions, such as the publication of a new article or review or an article being retracted. Since EVM events are stored on the blockchain, they can always be retraced retroactively. We hope this encourages others to contribute new and better interfaces, tools and infrastructure around DOJS. One feature we wish to build from the public data is a measure like the impact factor of a classical journal, where citations, the reputation of a citing author and other measures might be factored in.

We wish to take advantage of the data generated from peer reviews in order to create public profiles that make the effort that goes into reviewing visible. Like profiles on StackExchange5 pages or closed-source communities such as _ResearchGate_ or _Publons_, these profiles could be used to create a public profile for oneself. Since the author is free to choose whether their personal information is public by assigning more or less personal data to the on-chain account(s), they can do so anonymously. As long they have ownership over the public-private key pair, they can prove ownership of the publishing account by signing a message with their private key.

# Acknowledgments

We would like to thank Antonio Tenorio-Fornés and the rest of the Decentralized Science team for open-sourcing their implementation of the Decentralized Autonomous Journal. Furthermore, thanks to Ellie Rennie from the Blockchain Innovation Hub at the RMIT University in Melbourne, Australia, for introducing us to bloxberg and the idea of the knowledge club. Lastly, many thanks to the Max Planck Digital Library for coming up with and implementing the bloxberg blockchain.

# References

1 RELX, “2018 RELX Group Annual Report”. RELX Company Reports. RELX. March 2019.

2 Larivière, V., Haustein, S., & Mongeon, P. (2015). The oligopoly of academic publishers in the digital era. PloS one, 10(6), e0127502.

3 Björk, B. C. (2012). The hybrid model for open access publication of scholarly articles: A failed experiment?. Journal of the American Society for Information Science and Technology, 63(8), 1496-1504.

4 Hartley, J., Potts, J., Montgomery, L., Rennie, E., & Neylon, C. (2019). Do we need to move from communication technology to user community? A new economic model of the journal as a club. Learned Publishing, 32(1), 27-35.

5 Kochalko, D. (2019). Making the unconventional conventional: How blockchain contributes to reshaping scholarly communications. Information Services & Use, 39(3), 199-204.

6 Tenorio-Fornés, A., Jacynycz, V., Llop-Vila, D., Sánchez-Ruiz, A., & Hassan, S. (2019, January). Towards a decentralized process for scientific publication and peer review using blockchain and IPFS. In Proceedings of the 52nd Hawaii International Conference on System Sciences.

7 Jan, Z., Third, A., Ibanez, L. D., Bachler, M., Simperl, E., & Domingue, J. (2018, April). Sciencemiles: Digital currency for researchers. In Companion Proceedings of the The Web Conference 2018 (pp. 1183-1186).

8 Vengadasalam, S., Kleinfercher, F., Lawton, J. “Bloxberg, The Trusted Research Infrastructure, Whitepaper 1.0,” online: https://bloxberg.org/wp-content/uploads/2019/07/bloxberg_whitepaper.pdf. Accessed: September 6th, 2020.

9 Pentz, E. (2001). CrossRef: a collaborative linking network. Issues in science and technology librarianship, 10, 29.
